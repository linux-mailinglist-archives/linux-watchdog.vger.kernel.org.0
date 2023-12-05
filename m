Return-Path: <linux-watchdog+bounces-128-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0F804D0A
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 10:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E559A2815A5
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 09:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE6D3C6BC;
	Tue,  5 Dec 2023 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JNPDteP2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A12C9;
	Tue,  5 Dec 2023 01:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krapABaEQtv2GBmLDCZ1YyH1Y/sR+omRd/YEgGYRQvBtenMgecdDfP80DxE0JE+VfUWCBuodCmcIXgD44rX6eOQQwc8wZUX7fPwWxCAGpAtTrF/3d96R7jVZJHoUHsHxhKAizWptJPf5XWfe6oSeq+wZdZUqmngDPxalajumyVR+KHOut3XK+i7CnbjGXq46CPx/EWoTThPQKd3vG7nN/O3aP/ouMlw8c66Wwl2oooaE7JqQ5b0gYdhifmaF7wfpEw9F+uEr1/33TqJtcqihPHKV+pIOZQ9EiIe/CBgUKCWn7amajwp4EGszmOD44vroGFdVC+VwNsjKION63ZX5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9celKGTNubW77TGkwit3TfG0U5iXaorBjofm4rSXikQ=;
 b=RjsL7CvZTcHvJuougZ23G+lnxnW76rB4fH3dcp9O+oycuc3+NjK9/04pc+snvrhJOWNqVi5aAnLDjXa4COKxIm1Lqv26EVzfBs8pbQT/4ZoJ/nHEo+7w6zm5NrJ8tmhY9idGHQmiukIAYInj4ODnpYyvzx+rUJ7SiANRsD2VZqUgchBoRH1E41mJmzWeJeCf0whJfCUfOnkpy1Vjuz7qjLiI1vb2JB52AQs+zb0lYtJksSjZ2uYfaM7DMdKdeOGniti71tKd8OSXdtvqwzRY8B+n1nbWr8wX+RHZpI1cFdShQ7zw+t9Y1QoYzUE6W5SokRjVRiPq2BmBrpisylG+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9celKGTNubW77TGkwit3TfG0U5iXaorBjofm4rSXikQ=;
 b=JNPDteP2QDOzHIxv6EQJmnPUloZs5RLYowp2l2pRpnga5qyZzZbABfVW1+Ex5bPupquzYWEVBOaZiB2sOpauAAgN2rpYz4kZzUPbystOPbs+iPieF4nxyqxPfvpSVJhbnlSKUQt1p4E4NtTji5mvGZSodIE+q8k4Ch19pcHLoQA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8317.jpnprd01.prod.outlook.com
 (2603:1096:604:1a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 09:01:10 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 09:01:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3.1 3/8] dt-bindings: watchdog: dlg,da9062-watchdog:
 Document DA9063 watchdog
Thread-Topic: [PATCH v3.1 3/8] dt-bindings: watchdog: dlg,da9062-watchdog:
 Document DA9063 watchdog
Thread-Index: AQHaJtbjUhp7lJBO0kWW5EEF3xpZkrCaYY6AgAADFKA=
Date: Tue, 5 Dec 2023 09:01:10 +0000
Message-ID:
 <TYCPR01MB112695C00847C027AADBE718D8685A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1G1iKzsBd8iq0sbKrCvkQ0rSNRBc9v+_mGjyoNqY=cg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV1G1iKzsBd8iq0sbKrCvkQ0rSNRBc9v+_mGjyoNqY=cg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8317:EE_
x-ms-office365-filtering-correlation-id: 2b11ec51-012e-477e-43a2-08dbf570b9d5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hWsC7hwIKKUoh1BMQrNh7lE2/it/yzWGlZkCJNFq/BR8U4VtP6RswOjUk3+2fW92JRQtlvJzUq5zTQtGLN2LeiecpLG2t2jh6DrykQ3e8xAHMBrAiPBuODNA0hZBxsdVxl/jfx5uQ1KQ7E4rfW+jn6UwGrxpeYQhc29z0rD989GPS0fZaC6Or9b2OeMFDW8dZsH5vnzvr/ZKTxUIqSQZq07QPwVKC3VtsyJ8bsgLTJJ7BQ0WBbzft2fW4sTvlprMszuduNGWpV/1khrzjnaMKk81oIKQBkAet+JXtPmJIpKRIb4pGL1x9SZZRJZ+14/sbGTV8ehl9m0oJh/+nGSAsK5iR0z4c1gmtxLy39+P8Nb51nXvHWppK0qHlieJQXEMPRf3sqhDECkSXQFe63R561w0ijb3pZIqgOSoSEpu0jF6jm4CGm3SeB8XtTNwyR2DU4zHXkSRAVtR4cSNI0KTfhgTC2qkiuVGkfnSWFgp881rpCK8vjaYhveJ3mMwkCCxdgvldvE7KMXtjLKEzkffSBl8KWj6wpOvz/h2B5vLC68iXfIP2no0pDijsclUCIw7GZUfNZ6lcjVGkQffmpHCuSy1tZX0JQBJ+1+Kg+xzj+md95R3dStTSVb+xMNwJIxd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(71200400001)(6506007)(7696005)(9686003)(53546011)(83380400001)(7416002)(8936002)(52536014)(4326008)(8676002)(2906002)(41300700001)(478600001)(5660300002)(76116006)(66476007)(66446008)(64756008)(54906003)(316002)(66556008)(6916009)(66946007)(122000001)(86362001)(38070700009)(33656002)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MklQNzFNOWY3S3FZKzRoWDVkWVdwN3NqbjFYUDlteFJzWFZIQWdkMkE5S1Ji?=
 =?utf-8?B?dy9PU1RqWHFFL01jaUx5MXRuRitLT003eDIyTW9nUDE0cUJPeG9Jb0w2SDJq?=
 =?utf-8?B?TFh3US9MQkE0U2VCNUU0MHVWeTZUbGlDcHdjM3FTTkpPMkNrVEJVK0oyaHpq?=
 =?utf-8?B?dVZZaEppU254WlR1VXFZUDJBMGY1OE5IWTR2cVl3bEZ4SVBxbm1TT001Q3Mv?=
 =?utf-8?B?V21NdGIvMlN6RHRZSGJuS2YvenVpWi9TOGVwOFFsL0NyMUdqeHVuTGcyMFFU?=
 =?utf-8?B?bERDSzRBNHdkTmtoQ0JjU3ExWU1pbUVwN1FOV2Jtd0tVcG81UU5iNEt2TGlq?=
 =?utf-8?B?T1E1NE5LTDlBcFZpY3pwd2Z5S1ZHY2d0RDY1OVJwWmpGSmZ1b3JYRkhQUmNE?=
 =?utf-8?B?ZGptQXg5NUFZUnJJLzNrNDZOaXdzTWxkdTc1R0Z5aENqcjNCaGsvYUFnS0JF?=
 =?utf-8?B?YzFtWElPcXpjVWx3cjF0YVRvUGc0QlduY0E3WUFQU2l3YXhNRW5INFBKaXJs?=
 =?utf-8?B?K1dGSk9seHU2cFVqWUhhbGJIblM2NzVpNUQ4OE5aZVV3MFVmVXA4SmNISGNX?=
 =?utf-8?B?UTRQSkF5d2tpckF5UzJ5YnY5Vnp3SS80RE9QTlN0dG42dUNKR2pUb3BHUGp3?=
 =?utf-8?B?U1hQQWI1M1N4ZmtwTEo1eFRqbWhNaDBLbklBckVvTW9yeVAvQnIwZDl1eUZ0?=
 =?utf-8?B?emlMTWc1cXpYNHVOei9Yb0tYa20xMW1CV21TK1FqejdMai9iY3kzd0pJdFI0?=
 =?utf-8?B?aHJDV2xzWDBJaTFQZ1V6TWZrRmNaQkl6WFBwMmNVZVZ4MVJLak5MMDVkWWRP?=
 =?utf-8?B?Qnd5Q0tYMFNxbFZybUZPYXNkc2loZzZaVkVvTWFjL05PTENZUVNmMjg2dVll?=
 =?utf-8?B?cUc5QUR5N09Id0t4N0ZwdEVpTkM4d0c0cXJvTkxsVWxhVXhaeDRGK2l3VHJ5?=
 =?utf-8?B?dzVFUTVDTVlaODF1c0pyUFU0Nk1nRlNzc2hjR2ZlRmhjY21tS3lyZDduVTA2?=
 =?utf-8?B?S2h3M08yQ1RRblF2VkMxd0tBbVdvOU9TT1hBM2JDL25uQjA5M2EvR3lBbzl5?=
 =?utf-8?B?MEY0Q20wOUw2MUp4OXczbFl1VmN0ZFFBeXJFK1hZY3VKQkR3aW5aSEhHdXlO?=
 =?utf-8?B?K1ExdDkwbHVlNVJaU2lqZUwyeXl5bS9Fa3VkY3JpN0ZLVkx4Z0dqZ2dIcDE4?=
 =?utf-8?B?d2pqbUJXUlFOaW9pWnRUTGRjRTU5Q2FYN0wvN1laMWoyTERzaElPZjNIR3RP?=
 =?utf-8?B?dGhxamREV0EvVVVYTXh1d2J0cGxBV0VaM2hVbWpVaS9yRTJvZ3crekRhcER5?=
 =?utf-8?B?ZE9GbG9EanIwaTBnVFRlNEJibjN5SWc0MFhqYjl1MlpqeXNZZDZuREwvcmVu?=
 =?utf-8?B?VzFobUUyOVFYYjR0R2gvNzFmWERxWEtvSGpEcG1TNEJmQS8yeXV0bzBlclJV?=
 =?utf-8?B?N2M4UzEvUW9KcFdZMWNDZk5wcVlYQ013T0ZXcU1RdjlOdFZuMDZWU09lSWlH?=
 =?utf-8?B?TXh6cTBxYjExNWY1UkVJZWZabkdPUk5scEhmQzFpV09HU0tBbC9uTWNRZ0lH?=
 =?utf-8?B?OTcySXZwK1VITTgzc0hRQ0V2SElOWlRVb3B5T0tZbG9QbnBJTjFLVWgrUDN6?=
 =?utf-8?B?dVRDeWNweVB2RkVwM240dzhwSkhrSmhsYXBuQm56cUxUaFNaSytUOHB4T25k?=
 =?utf-8?B?eHBGSG5aR2xqTE5CVmg0ajJhUkw2LytvTlorWDJaR3hkK2VVaVRhVitIdHdP?=
 =?utf-8?B?WHd4OHIrWi9tdjU3RVZOVm1STWxqd2tCVjBEL1VyUTdnZDdPYWVXbHhBbjRJ?=
 =?utf-8?B?d2ltVjJCMlVlWFBrUlZjb3MvYU52Q0p5K3NXeXJvenFXUnlnOUoxNG9UU2hH?=
 =?utf-8?B?WjdCaWRWRDlhKzRJR1orMlQ3djcrVklwYVJURWs1TWpMdXZxZENjUXlicXNq?=
 =?utf-8?B?OEZWam13dmkzMHUyb3QzR3dmQitjbzJtUm13Njg2QVdtc3hFWmd6aGNnUnlO?=
 =?utf-8?B?UGV2amZhRWx6NXd1OWFrTGNObjR4QTd2WWQ1a1dqZXdjQm9mTEVFanlXbWFS?=
 =?utf-8?B?R3hhWnE0Q0ZqWVdqeHdlZUcra0ZsdmgyK0RQNUJKV05YWDdaODZYM3ZRc0dO?=
 =?utf-8?B?Nkc0dFBZWjZ1bFZmclRGVW81eFdsKys4YlFtSFhWN0lidlJRUUtKajd4bzVy?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b11ec51-012e-477e-43a2-08dbf570b9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 09:01:10.5737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gRJ1e66/LMGoOlyjKfCvYOw+oe185ZdV+5XGVQHVV8vUGyUFsR1wQ2ORkZv+K/HDPXEMPGBKNS63Y6MiMYv67M8RqwR+l3PWpwWdlT2x/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8317

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDUsIDIwMjMgODo0NyBBTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzLjEgMy84XSBkdC1iaW5kaW5nczogd2F0Y2hkb2c6IGRsZyxkYTkw
NjItd2F0Y2hkb2c6DQo+IERvY3VtZW50IERBOTA2MyB3YXRjaGRvZw0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIE1vbiwgRGVjIDQsIDIwMjMgYXQgNjoyNeKAr1BNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgREE5MDYzIHdhdGNo
ZG9nIGRldmljZSBhcyBpdCBpcyBzaW1pbGFyIHRvIERBOTA2MiB3YXRjaGRvZy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4g
PiAtLS0NCj4gPiB2My0+djMuMToNCj4gPiAgKiBBZGRlZCBBY2sgZnJvbSBDb25vciBEb29sZXku
DQo+ID4gICogVXBkYXRlZCB0aXRsZSBEQTkwNjIvNjEtPkRBOTA2ezEsMiwzfSBhcyBpdCBzdXBw
b3J0cyBEQTkwNjMuDQo+ID4gICogUmV0YWluZWQgUmIgdGFnIHNpbmNlIHRoZSBjaGFuZ2VzIGFy
ZSB0cml2aWFsLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0NCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9kbGcsZGE5MDYy
LXdhdGNoZG9nLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvZGxnLGRhOTA2Mi13YXRjaGRvZy55DQo+ID4gKysrIGFtbA0KPiANCj4gPiBA
QCAtMTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAg
ICAgICAgICAgLSBlbnVtOg0KPiA+ICAgICAgICAgICAgICAgIC0gZGxnLGRhOTA2Mi13YXRjaGRv
Zw0KPiA+ICsgICAgICAgICAgICAgIC0gZGxnLGRhOTA2My13YXRjaGRvZw0KPiA+ICAgICAgICAt
IGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogZGxnLGRhOTA2MS13YXRjaGRvZw0KPiA+
ICAgICAgICAgICAgLSBjb25zdDogZGxnLGRhOTA2Mi13YXRjaGRvZw0KPiANCj4gVGhpcyBtYXRj
aGVzIHRoZSBleGlzdGluZyB1c2FnZSBpbiBEVCwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBIb3dldmVyLCBJIGJl
bGlldmUgd2UgZG8gaGF2ZSBhIHJ1bnRpbWUgaXNzdWUgaGVyZSwgYXMgdGhlIGRyaXZlcg0KPiBj
dXJyZW50bHkgbWF0Y2hlcyBhZ2FpbnN0IGRsZyxkYTkwNjItd2F0Y2hkb2cgb25seSwgc28gdGhl
IHdhdGNoZG9nIG11c3QNCj4gYmUgbm9uLWZ1bmN0aW9uYWwgb24gREE5MDYzPw0KDQpPZl9jb21w
YXRpYmxlIGlzIGRlZmluZWQgaW4gWzFdLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVyWzJd
IGlzIG1pc3NpbmcgdGhlIGNvbXBhdGlibGUNClsxXQ0KZHJpdmVycy9tZmQvZGE5MDYzLWNvcmUu
YzoJCS5vZl9jb21wYXRpYmxlCT0gImRsZyxkYTkwNjMtd2F0Y2hkb2ciLA0KDQpbMl0NCmRyaXZl
cnMvd2F0Y2hkb2cvZGE5MDYzX3dkdC5jDQoNCk5vdCBzdXJlIG9mX2NvbXBhaWJsZSBpbiBNRkQg
d2lsbCBpbnN0YW50aWF0ZSBkcml2ZXIgWzJdIG9yIG5vdD8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

