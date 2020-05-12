Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1719F1CEB27
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 May 2020 05:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgELDKM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 May 2020 23:10:12 -0400
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]:21090
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728455AbgELDKL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 May 2020 23:10:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQwuItf7emexGXD8LiDVj6mB8dbYAF+3YCh+SkAsulBS9ztQBqIFpJfiplkIPQg/2+ihn80sBez629gT+w65oo5Ku3am0/2BXJSymj7xHYu3fI0lClfkgRGXgYUcpyoI4xRc6pYBt3chfL+1m4IvfAQ0zl92WSCfk69FTr+zgEVfZVGeUq7YEVMYeqqD0Oint+PzmkKbQAGj8x9vkzA7qgoHCsZBa2enlkZ8KUPc22JtxieNcNZv0cX7VplL0nAVknjWoeLmelsDMfNnyxyDFvxfkJ03bpIIepwtMaoPQg3F/Yr9bdanlfcBfmKAybhx63ZrIMytxZwWDrGrKVHX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg9bwGU3JBNOHTKy77KQDb4gOB8YYktivDJntGkAlv4=;
 b=HCL8th9QMFAlIL8NgpNIc1LWhlcO1EkNFp0+VA8DFNVU27YOGrOssmlAvN9qhamllFDEvfa91BAX8Zor6hnl1+9nyLakYyQpTAWvASlZ85HLKLUl/HVhVlzs5wwee56q4ZhYttILnjZrlXxE0Jvf90oUz2Q90k4vTnbKubRVwPAU52PudToXU/93A1Y9yp3fLXEBgGqRHDSReNQyWSq6VP484nYRpPVXmvXfXs7OKxejnsCPqOoYM7LeAZEVEUtOQR317wPE14TKvaf6pjMwNNzAnIH51FQoam4GciHp7WCb9r4HcnmcJHkhj4l3lG0RaTwe4yqLF5JRHohkkCHkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg9bwGU3JBNOHTKy77KQDb4gOB8YYktivDJntGkAlv4=;
 b=XoKFrLtqRQ9vkh6/koWbOCzp5nrPUSMo4FF74JoSVVrzf0LW4U8zZsExCJfBoNRD3t+vXG2sRVIgcivqqujs1UQ0CEi7b3m8NbD3HDej52tkswHOXhfQqqjH/Mqrp1ASxIBkb+s8HBt6y/89KZxHLfiLLi+YWOTwo0PsphRLY04=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5958.eurprd04.prod.outlook.com (2603:10a6:20b:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Tue, 12 May
 2020 03:10:07 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 03:10:07 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Rob Herring <robh@kernel.org>, Anson Huang <anson.huang@nxp.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/2] dt-bindings: watchdog: Convert i.MX7ULP to
 json-schema
Thread-Topic: [PATCH V2 2/2] dt-bindings: watchdog: Convert i.MX7ULP to
 json-schema
Thread-Index: AQHWEr+TVK93diGub0mNz8SI49iFZqiCj5eAgCFdqyA=
Date:   Tue, 12 May 2020 03:10:07 +0000
Message-ID: <AM6PR04MB4966CC101E5D2F8B3CE6E3A880BE0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
 <1586911211-1141-2-git-send-email-Anson.Huang@nxp.com>
 <20200420212751.GA7615@bogus>
In-Reply-To: <20200420212751.GA7615@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34398e90-3911-4ebe-d973-08d7f621f94b
x-ms-traffictypediagnostic: AM6PR04MB5958:|AM6PR04MB5958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5958205F879ACA2004C3BF3380BE0@AM6PR04MB5958.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3oKi1Oc6Z8f1VwgdgLyYxn7ZHPZwu9QAcJ3dp/dj1bbhwlIRmk8zsFV6VgVvtacuQYg0kdQTtDCebOLQxyNcy2FWYB0jFCq8OCrRNwp3rbUnZtsAQ3bagTcro0eqZoJnDBeufLKADwIzd8/oTocOEBw918HdM3OeOTYHLpdAm+8oT1KZtg4Yf05n+803md3MkifaPz46+mzOhlnI9hcULfEgDwgr5S35OPeVt6522jlSylGHoBELsoO2m6/jxbKw0eaRmKnZg9inC1XVO3xWnWGdUrar1SxlUfBcYn1InUpgqY+XP1qzgRudmNMwNB8mX0hUfKeVE603g4xVg4Hxe/G4lf11OshlJSi3ZpJf8wxpS+GvoA5Pcc8qkSeHvHZsVu36qhN59E+7lTU4JvhdMQoByYrjRACt4AknR1dau9jSdhyqC4oGqcNNMpkUTEq13Kd1mq2qduEIFIAAyMtjUklDcnPgn/XgZ1+R2Noks0XrYD3wHljkb03aK1XOQfLXQAAvOQO0HeboSYgmNbHHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(33430700001)(33656002)(26005)(33440700001)(110136005)(7416002)(54906003)(478600001)(186003)(2906002)(316002)(44832011)(6506007)(66556008)(66446008)(8676002)(5660300002)(66946007)(8936002)(86362001)(76116006)(6636002)(52536014)(9686003)(4326008)(7696005)(71200400001)(66476007)(64756008)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VmfuBhId2plaHUVOSFKntwSpK8rxYBmUHXoYSsApvY/1/t77geF0vb316pKgmpeuJqXD8ewrQtdN5fBbb5mS2SqPPPGDexmz9kWmmQaBrMmjQ8i//1jZlIVNkZsIMhVqBtGGQECvbMfx55IqSwv4/rRTcTijh/wXCBeWCI2S5a7IsjJyw2CPFAsryJ3tnbdkcVSo7wiVFsRQSHRdmrwcA9EW0X/EYtTkJaxs7jdyiv89E+xmG2Gkn7H8SOM9trowqnJQCX0Zgb3PLi1dN+d8vBa1+za1IbP6zQiLQJsymVHLLdAxdcaQLI+rxijimQR5ifzvjgrwR6vmJl7CyTjAHm1qE8JPeufaEWh5BaQg2+sV5vxhiRCm8dgP/EFco7g2PXMbqAkBrmS19g5AyisqDXvOK6BbR18I3RXXQU3evga8sk+p2YPlnHQOReHxCIi+FyO7zonZc894ijKT2nH1cXO7E4YkjR4TZpCPztPPOKK3wLsTLl3igr7yCmA2a3PE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34398e90-3911-4ebe-d973-08d7f621f94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 03:10:07.2486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzbmRILln0Ye7UgopOyWrauAdY69/EULYXBmlkHvvMWN8wke5hrA3GxNf26kvzr9YaTRr575kW+Yaifmh6zjOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5958
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgUm9iLA0KDQo+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6
IFR1ZXNkYXksIEFwcmlsIDIxLCAyMDIwIDU6MjggQU0NCg0KWy4uLl0NCg0KPiA+ICsgIHRpbWVv
dXQtc2VjOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBDb250YWlucyB0aGUg
d2F0Y2hkb2cgdGltZW91dCBpbiBzZWNvbmRzLg0KPiANCj4gVGhpcyBhbHJlYWR5IGhhcyBhIGRl
ZmluaXRpb24gaW4gd2F0Y2hkb2cueWFtbCwganVzdCBuZWVkOg0KPiANCj4gdGltZW91dC1zZWM6
IHRydWUNCj4gDQoNCkEgYml0IGludGVyZXN0ZWQgd2hhdCdzIHRoZSBkaWZmZXJlbmNlIGlmIG5v
dCBzcGVjaWZ5aW5nIGl0IGFzIHdlIGFscmVhZHkgaGF2ZSBhIHJlZmVyZW5jZQ0KdG8gIndhdGNo
ZG9nLnlhbWwjIi4NCg0KK2FsbE9mOg0KKyAgLSAkcmVmOiAid2F0Y2hkb2cueWFtbCMiDQoNCkkg
c2F3IHNvbWUgbW1jIHZlbmRvciB5YW1sIGJpbmRpbmdzIHNlZW1lZCBkaWQgbm90IHNwZWNpZnlp
bmcgdGhlICd0cnVlJyBmb3IgdGhlIHByb3BlcnRpZXMNCnJlZmVyZW5jZWQgZnJvbSB0aGUgcGFy
ZW50ICJtbWMtY29udHJvbGxlci55YW1sIi4NCg0KV291bGQgeW91IGhlbHAgY2xhcmlmeSBhIGJp
dD8NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAt
IGNvbXBhdGlibGUNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0g
Y2xvY2tzDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+
ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9pbXg3dWxwLWNsb2NrLmg+DQo+ID4gKw0KPiA+ICsgICAgd2RvZzE6IHdh
dGNoZG9nQDQwM2QwMDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg3dWxw
LXdkdCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4NDAzZDAwMDAgMHgxMDAwMD47DQo+ID4gKyAg
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU1IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+
ICsgICAgICAgIGNsb2NrcyA9IDwmcGNjMiBJTVg3VUxQX0NMS19XREcxPjsNCj4gPiArICAgICAg
ICBhc3NpZ25lZC1jbG9ja3MgPSA8JnBjYzIgSU1YN1VMUF9DTEtfV0RHMT47DQo+ID4gKyAgICAg
ICAgYXNzaWduZWQtY2xvY2tzLXBhcmVudHMgPSA8JnNjZzEgSU1YN1VMUF9DTEtfRklSQ19CVVNf
Q0xLPjsNCj4gPiArICAgICAgICB0aW1lb3V0LXNlYyA9IDw0MD47DQo+ID4gKyAgICB9Ow0KPiA+
ICsNCj4gPiArLi4uDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo=
