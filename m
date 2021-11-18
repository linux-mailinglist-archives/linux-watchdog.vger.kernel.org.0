Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC1645600A
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 17:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhKRQE0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 11:04:26 -0500
Received: from mail-tycjpn01on2129.outbound.protection.outlook.com ([40.107.114.129]:9345
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229936AbhKRQEZ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 11:04:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJwVgtYl3uMUaVwlAkp0yY1VtB+jUQ/6fs01VQIE6u4BMDRkz8JBrlohGA46CSZIUXIbUcXo0kW7cLKFEeOLL/qAfThWWTPOxJLlleGrw3k5eYFebN9a3qfBQYEHMK+XqQNlLLwEzsezYRIZDoGjpp4u1zF1t5g5dF5YPV+luiKdLyz47VBo2x1uRLkQJvmgqChDmXXQeXZOnUHQfW0toIjD1xX2vx5WihcfUyzEWEcJeTFQMpwwzDw/QFptRQJnAj3H7kmr7CmudJ6gCGfAgMR8vzHmR+sv2yil0KaTs7LyQ0TarmJXvnWEqL2vjaj4Nb9RJm2DVrZYAwD+Twolvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNs3MDT3ERmSxXMBSXJabuxvKhkNlUzPWoPZLXfG1gQ=;
 b=BKSk5Al9buiggmL/8SvdgiSeXBGKr3rwHFqK5mr5YJYySid/GTYRWVuKgyqqP+yBTp5hADs9U0+AX8+KZzpQX1HAfx3ZvwtHgP3ARF+P78vpTCu7lhiZihIb7TsLnZyiHs7zKc1Y3p4zYJ/J7breltejaj9Y0L8Fj96kbvm9qiIV4sNcr/r8qbVpsNCp7k+5ZmX9rUrsWDYpGwhW/wHNXX03KqOmSdNXfTXzP0/+tv0bnBTwa0AeQU5E7mfCeHwBmFYEHt1DBTw2SyU+DxyfDqpb5zkjVKC+CIYw+T5rHP3QpUS3V//dJJTvInZCyPEF+gntiEi2un+iFIzC2phw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNs3MDT3ERmSxXMBSXJabuxvKhkNlUzPWoPZLXfG1gQ=;
 b=Y3+COdnLQSHVi8Osbch4YQ6Nks1e3aeiy6J6ArAApb0EOMF3kmvziXfHYSscHh/J1Vdg0ERQ5Jed+YFmy3t7c2F8BHKqhHmFiixs7fc9yJDRCRqzVGmraS5fHJ+pGsmLIuAqVTzt6GaO4oeBXITEE+faC3MQsZWE7INU5cVCy5A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4322.jpnprd01.prod.outlook.com (2603:1096:604:64::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 16:01:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 16:01:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Topic: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Index: AQHX1vLnlfB1SUBaW0CHFGqbJXktJKwG4nSAgACCKpCAAaF/AIAAdJsw
Date:   Thu, 18 Nov 2021 16:01:22 +0000
Message-ID: <OS0PR01MB592263674F271F4B58B9BFF7869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
 <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com>
In-Reply-To: <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a013eaa-6637-4775-1cd9-08d9aaacaaa0
x-ms-traffictypediagnostic: OSAPR01MB4322:
x-microsoft-antispam-prvs: <OSAPR01MB4322D229F503C985C9F02DD7869B9@OSAPR01MB4322.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O7slIdczqN21u2kjp/ohZvUuyNDkWnMu+mUyX2yFkMsk5t/qkIX+Sg2lxPaPex16gHRNZSp4ONcKxuu/rgphxS17Ht+53baGvx3DQBSjgZ36O8LLT9HdjvD+dGRenVY1NUud/jhVEYgMsGLyfTwZb4xeNql4X2VZkMoRUB1uXSIGciwEmkIKDMQEigrP9btlsKJMElQZpLbX9rBmTyWnEJ9HmQbwJf1yS3NjfjY0ELkcm+lRz/m2fTE/l6gHJTyi1ewTVlSwOCPU3foi9lYBmB3y6SX8owPAh7nxeZd77gqQcLVxXQSfQ9sIvwb/YI7+67yKzVdApd1BGIw2cLCnAtoz6iGoROBiO/vhTFihLCWbhxE0l2lcr1RkfwrFXMCOpCNI/BYaz6n46S0BXTwgUVotyT9hoshyh1mgQV5c0kaQ52m9DJ3XGDJQDDf8RPuBDkma4F4TAlnPEYAEvznRw+9yp7u6XK4axnHOMvrL3W58JrQy/fQ+qjt2kNbPirO5J/5VYR6SwoJNVOK+RSHWHdaj/9/yLvkbWP6X+W238h5tZiIyhIEiuYVD5ttou+V3baEcvGj0oHBI/bFi6h2JEFXEro/kk6KhMY0WhNpbommNn4GLkF/WCabfA/MQ06YbHVvnigNtuiio9c8CsAsqMNdn5lMqpY9J5A+OVqhozywd/Ba1+r6+TKrfCrXctKQxdsStJhBit5QEFS9JpseiQ00rQ4XJwnjJSZTB4hPxACs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(33656002)(508600001)(66476007)(107886003)(66556008)(55016002)(86362001)(52536014)(66446008)(64756008)(26005)(316002)(71200400001)(2906002)(9686003)(5660300002)(83380400001)(54906003)(8676002)(122000001)(53546011)(8936002)(7696005)(6506007)(38100700002)(6916009)(38070700005)(76116006)(4326008)(186003)(171213001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0FwSzRkaTljdFlyRGJrK3g4bWpOM0dqbWJ3a3FxM3lqUmtZZG9QZVJKYjZi?=
 =?utf-8?B?ZnJGamhPM2lqSHArVUdyU0tMdVhjY3lHYkd0WUJEdXVMWGhiVE5FdGRJb1Y5?=
 =?utf-8?B?aHZva3haQ3grM2RFUVF3S0MzNHBQM1AwQTZGeE5VZmhJcVVWRVZXemZFUkxK?=
 =?utf-8?B?WksyWlRBWHFnd29QczJUNEFzVVRXdkVaaWtGY0pFZnBiQkUzb3IzU2NaSGRI?=
 =?utf-8?B?M3I4d2xVbzdLRHNIWDhyN3E1eXkwMmRRNXVtOElqNjk4T3Y2Y3U2VW1BL0Zi?=
 =?utf-8?B?VUNzbm5xaTAxdXlFUjhxWUgyVjRnWXJEZVdRRDdyUldmZUthekF6c2FLajNL?=
 =?utf-8?B?UTVMbVBldkpQeG55K1FyOFRMT1BYSzAzdkZiQVVZdWc1V3JRR2MyL09tWjd2?=
 =?utf-8?B?eTJYQnVya25PMzZiYlN5M0pqb2VhV3JZWmtjMVBZb1p3YnpSa01tZmJ2b0x0?=
 =?utf-8?B?Y0FCcU4vU2VpZGxxR0ZLbDVMbjUrRFVNdzR4WTMrNFBiZTlldTdqWHlpWFY2?=
 =?utf-8?B?QmpVOHpnQndaaGFnbUVFZXMyajJoNHJyS1drTWU2RjcydXlnVjlodXp6Z0p5?=
 =?utf-8?B?dS9hdUlBWUIvS3dRdnRGRXdhdzJSYVVpby91b3VHVEdMT2RuTTB3RVdPalFR?=
 =?utf-8?B?M3djWWJPb3BJNEt0ZkFCZlJVZlpzSDFvRVhNTmVJdC9jS0c3OHVMZ3lDSlNu?=
 =?utf-8?B?UEZ1ZmFFNWJzTVQ2dkhjbm9EdkN4Slk2L1luVWRIcVZCQTBSV0JoWEZJelRO?=
 =?utf-8?B?Z3Z1d0h5cU9MeVlrMGxMelpYYW1yNDZLb3dzM2F6Qjl1RFJqNHZDQjVSeHda?=
 =?utf-8?B?K0Y4djRaeko5Y2RYaGs4eXgrZFFXSzU2WC80TU1FeUE0ckI4eHh0aDMxVlZD?=
 =?utf-8?B?UHA3NlA4RVpsM0NFQk1DeEdqZkdxeUdSRkdhRXlBbCs2bTJJZkxJOWo3disy?=
 =?utf-8?B?amQ4SzRDczFJNGpOcXp5MmgzUmRseEhYTW5idWlBQWVZdjYxZ1l4SWtMaFVa?=
 =?utf-8?B?dTNQOHhjNWRvd1lMd1hIL2hvZkhFMXFWaHQ4MEd4MmlzNWppbUF5Q2x1K0h5?=
 =?utf-8?B?VnViUDB3b1pOcSt6clJoMWRzTTRPZUNLU2RHQWZVWnd5WkdGUVRGL3VnUnJi?=
 =?utf-8?B?ZEo0dy9lay9pN3MxZ0c3S0ZxWmhEbGJqVjJReGlNTFU2bWtoQ1RGSlRqamRJ?=
 =?utf-8?B?Q0tYci83YjgvNDFUbGlnMkllcndDY0lZVCt4bGE3WGtxL0paQnV2SGhIUWtm?=
 =?utf-8?B?M3FIaDdxa090R2xJaHVBekdoVkxIOXcwOTlkVExhVkk4ZzFFOUpPQ0RjUnB1?=
 =?utf-8?B?USsybUlSRDd2dlFIclpzWEtuZXhvb2M4NzhPWktjUkhkSEZNU2JvaEJaeFR3?=
 =?utf-8?B?bWFNdjZBV0dCdnViZHNtdW50dndCemY4Y3RFeVUwWGw1VGxMc1ZOYy9EM2Ur?=
 =?utf-8?B?WUhvN3ZjVHNyVEd4amh2UmNuUnE5TnpUQTcrRDJJRzkzQlIzMDlRSW9TNjNj?=
 =?utf-8?B?WXRsT2pSRnlaZWRrLytwVDEvT0VIMWtXQ3RqaWlhelFXRU14dUpBdHBDZjFu?=
 =?utf-8?B?Nzc1emtLdm13Vk1wNmFxZlkrV1NCRlQrcUZEbFhvdGwyVU03ZkNDZ2lmV0ov?=
 =?utf-8?B?UXlTM0dncFp0eThMQVREN0xnSzZjMHVlU0Q0NXJ0OGFhbndoQ1pqelNyMWtr?=
 =?utf-8?B?MjlRNlJIcWh2ZjIwblhTQUVRMjc5MDdWMUNZTXZQR0JsYXpJODF0UmdBWmFB?=
 =?utf-8?B?WlhBN3hIUXhETk4rcGZKNllKYXBCaUZTNlo3czRINjg4WTY2L1c1a3duTDdy?=
 =?utf-8?B?S1RjNHEwMUtFUGlpNkxtcFFYK2lNTStUODd2UCtwaWlOUDltcGlOOWx6OUdK?=
 =?utf-8?B?QUJ6TXJNb2RwUUhCT080VGZQZzZrNmQ0NmxCRlkyczEvS2hBWFh6SEp6NUtp?=
 =?utf-8?B?V2tHRUx5UVp1N1gydElkRTY1enZNZEsxSWJjRWdvZGxFOFlGUFlsWnNqZklP?=
 =?utf-8?B?ZXBqNjMveW51eVNWZTFDZEZDRnl2cWtPUVQrZU9OYzdqNlNicmZCc29xMWw5?=
 =?utf-8?B?RXY1RVFRckFiaW1JQXhnQjlZcFlPY08zVzNjZlJ2R0QxSFFGelB6Y0t3TVRD?=
 =?utf-8?B?MTJiZDJjaTd3VVhTNWlUSWNSc1VGOG84VHo4SC9PM0dncnJ4RXZFcUtzbG5k?=
 =?utf-8?B?RDJ4VFNQaDlwWHZTaDkyblNkVWxOTlFhdjgzNTBmN3BPTyszN0VNWm9mTW1u?=
 =?utf-8?B?cVVqSGx4K2tnNFF6SFZPVitoTS93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a013eaa-6637-4775-1cd9-08d9aaacaaa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 16:01:22.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NClaIYyuwLBMo3ww/6qcdz35ubVTXGPXefhxw9W1ke83HC3juv62ICbNQMfNJYg2PCcezkQ9E24XXOmBNhSC7WztSfm/IlHh9jhDSyImwXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4322
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8zXSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3Igd2F0Y2hk
b2cNCj4gcmVzZXQgc2VsZWN0aW9uDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBOb3Yg
MTcsIDIwMjEgYXQgOToyMSBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+IE9uIHRoZSwgbmV4dCB2ZXJzaW9uIEkgYW0gcGxhbm5pbmcgdG8gaW50
cm9kdWNlIHRoZSBiZWxvdyBjb2RlIGZvcg0KPiA+IFJlc2V0IHNlbGVjdGlvbiBiYXNlZCBvbiBk
ZXZpY2UgYXZhaWxhYmlsaXR5LCBpbnN0ZWFkIG9mIHNlbGVjdGluZyBhbGwNCj4gPiB0aGUgY2hh
bm5lbHMuIElzIGl0IHRoZSByaWdodCB3YXkgdG8gZG8gPyBwbGVhc2UgbGV0IG1lIGtub3cuDQo+
ID4NCj4gPiBub2RlID0gb2ZfZmluZF9ub2RlX2J5X25hbWUgKE5VTEwsIE5VTEwsICJ3YXRjaGRv
Z0AxMjgwMDgwMCIpOyBpZg0KPiA+IChub2RlICYmIG9mX2RldmljZV9pc19hdmFpbGFibGUobm9k
ZSkgew0KPiA+ICAgICAgICAgLy8gc2V0IHJlc2V0IHNlbGVjdGlvbiBmb3IgdGhhdCBjaGFubmVs
DQo+ID4gICAgICAgICBvZl9ub2RlX3B1dChub2RlKTsNCj4gPiB9DQo+ID4NCj4gPiBub2RlID0g
b2ZfZmluZF9ub2RlX2J5X25hbWUgKE5VTEwsIE5VTEwsICJ3YXRjaGRvZ0AxMjgwMGMwMCIpOyBp
Zg0KPiA+IChub2RlICYmIG9mX2RldmljZV9pc19hdmFpbGFibGUobm9kZSkgew0KPiA+ICAgICAg
ICAgLy8gc2V0IHJlc2V0IHNlbGVjdGlvbiBmb3IgdGhhdCBjaGFubmVsDQo+ID4gICAgICAgICBv
Zl9ub2RlX3B1dChub2RlKTsNCj4gPiB9DQo+ID4NCj4gPiBub2RlID0gb2ZfZmluZF9ub2RlX2J5
X25hbWUgKE5VTEwsIE5VTEwsICJ3YXRjaGRvZ0AxMjgwMDQwMCIpOyBpZg0KPiA+IChub2RlICYm
IG9mX2RldmljZV9pc19hdmFpbGFibGUobm9kZSkgew0KPiA+ICAgICAgICAgLy8gc2V0IHJlc2V0
IHNlbGVjdGlvbiBmb3IgdGhhdCBjaGFubmVsDQo+ID4gICAgICAgICBvZl9ub2RlX3B1dChub2Rl
KTsNCj4gPiB9DQo+IA0KPiBNYXRjaGluZyBvbiBub2RlIG5hbWVzIGlzIHZlcnkgZnJhZ2lsZS4N
Cg0KQWdyZWVkLiANCg0KICBBbmQgd2hhdCBpZiB0aGUgd2F0Y2hkb2cgbm9kZSBpcw0KPiBlbmFi
bGVkIGluIERULCBidXQgdGhlIHdhdGNoZG9nIGRyaXZlciBpcyBub3QgYXZhaWxhYmxlPw0KV2Ug
d2lsbCBqdXN0IGNvbmZpZ3VyZSwgYnV0IHNpbmNlIHRoZXJlIGlzIG5vIHdhdGNoIGRyaXZlciBh
dmFpbGFibGUuDQpJIGd1ZXNzIG5vdGhpbmcgd2lsbCBoYXBwZW4uDQoNCj4gTW9yZW92ZXIsIHRo
aXMgbG9va3MgbGlrZSBpdCBzaG91bGQgbm90IGJlIGNvbnRyb2xsZWQgZnJvbSB0aGUgY2xvY2sN
Cj4gZHJpdmVyLCBidXQgZnJvbSB0aGUgd2F0Y2hkb2cgZHJpdmVyIGluc3RlYWQuDQoNCkkgaGF2
ZSByZWZlcnJlZCBjb25maWd1cmUgb3B0aW9uIGZyb20gcmVzZXQgZHJpdmVyIGZvciBSLUNhciwg
d2hlcmUgV0RUIGlzIGNvbmZpZ3VyZWQNCmluIHJlc2V0IGJsb2NrIGFzIHNpbWlsYXIgcmVnaXN0
ZXIgaXMgbG9jYXRlZCBpbiByZXNldCBibG9jayByYXRoZXIgdGhlIHdhdGNoZG9nIGRyaXZlci4N
Cg0KTWF5IGJlIEkgc2hvdWxkIG5vdCB1c2UgTWF0Y2hpbmcgb24gbm9kZSBuYW1lcywgcmF0aGVy
IHVzZSBiaXRtYXNrIG9mIGJpdHMgYXMgeW91IHN1Z2dlc3RlZC4NCg0KUGxlYXNlIHNoYXJlIHlv
dXIgdmlld3MuDQoNClJlZ2FyZHMsDQpCaWp1DQo=
