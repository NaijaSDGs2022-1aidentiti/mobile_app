class CreateWallet {
    CreateWallet({
        required this.wallet,
        required this.account,
        required this.img,
        required this.note,
    });

    final String? wallet;
    final Account? account;
    final String? img;
    final String? note;

    CreateWallet copyWith({
        String? wallet,
        Account? account,
        String? img,
        String? note,
    }) {
        return CreateWallet(
            wallet: wallet ?? this.wallet,
            account: account ?? this.account,
            img: img ?? this.img,
            note: note ?? this.note,
        );
        }

    factory CreateWallet.fromJson(Map<String, dynamic> json){ 
        return CreateWallet(
        wallet: json["wallet"],
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
        img: json["img"],
        note: json["note"],
    );
    }

    Map<String, dynamic> toJson() => {
        "wallet": wallet,
        "account": account?.toJson(),
        "img": img,
        "note": note,
    };

    @override
    String toString(){
    return '$wallet, $account, $img, $note';
    }
}

class Account {
    Account({
        required this.address,
        required this.privateKey,
        required this.mnemonic,
    });

    final String? address;
    final String? privateKey;
    final String? mnemonic;

    Account copyWith({
        String? address,
        String? privateKey,
        String? mnemonic,
    }) {
        return Account(
            address: address ?? this.address,
            privateKey: privateKey ?? this.privateKey,
            mnemonic: mnemonic ?? this.mnemonic,
        );
        }

    factory Account.fromJson(Map<String, dynamic> json){ 
        return Account(
        address: json["address"],
        privateKey: json["privateKey"],
        mnemonic: json["mnemonic"],
    );
    }

    Map<String, dynamic> toJson() => {
        "address": address,
        "privateKey": privateKey,
        "mnemonic": mnemonic,
    };

    @override
    String toString(){
    return '$address, $privateKey, $mnemonic';
    }
}
