Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AA047193D
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 09:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhLLIQX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 03:16:23 -0500
Received: from mail-tycjpn01on2094.outbound.protection.outlook.com ([40.107.114.94]:54014
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229772AbhLLIQW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 03:16:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdgRHYdSNiE09OZeW2fCjVJkiPxywugLjUd1X/IUnh5Svp+HJHg5CO3rRcyIYRDXWep27fCheNkTAGnv2QV8aPHPO4A69sK7pEynMQyQeng7aVJ82kiYix0WcwGGAkiFPgUxu11iVS7Ic4cuh+KGdXxLZg9CVlsdZrPWNzcdOSmbQTmUVTqCF2Ih5h0woROkZ4/PDZaoM3jneBM4M7X84oA9CqsI2gJNnzAphCn81i8txY4IsMBhGrR9OlEZtQEB7DUUfW9Nwd3ECMpX+xyQDrG+n+fWeOy6QShMVh53Cw25EI6xmbhG341IRQv6fr/JQa6lB5N6tTaoqOKCcBKMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgeJE9Ww+L0LUXbFKRImfpWIfn5gGAAGgUu1cCE2pgM=;
 b=diyQa0mSQb8NcTIaDzeDuNLfdXoDOB19OG6Y72a653UVuaoRUYPtirOv9AAjxk3i1d7xYhsqE3L5dYLe1jn/4zqVW4Ykpku/7sgMp3mAbNCBYXv/k010vVidRo+fzUQ0aXoI1p594v76rTSxOxTssBBUkiVKDLJEJI8fBhTYmUs8mQuvWSGVOZVDnEuUN1AQ1ComHX1y+fn65zt4h0Ll6ykLvpthIXNE1fzaIV62Ay5IJ1Na3mbhPZ0Lbi58/F61ZV0ncOeKkPLRqwiS5wMTz+r6b1vCObm008sbIbuoOUS0P9icRfv6/LGBW3lDshD2wy+OPFq5uwqLpwrsMvXSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgeJE9Ww+L0LUXbFKRImfpWIfn5gGAAGgUu1cCE2pgM=;
 b=DAtmFv3HJqPCEbXSqv0BeQimfJ6qdb0ere7lvahnQrEKF+h+RBmLQ8YOPzIkM9Tcj4li9bvRTrPFwVAumdCJwtx5XMmbYnKpapqUx4yBCVin+0R7c4fqZo1FFppujpelK4cb/9stCrJDNEySV3APNQ0pw1Y86F6H4sJsfZ/hbYE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4321.jpnprd01.prod.outlook.com (2603:1096:604:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Sun, 12 Dec
 2021 08:16:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4778.017; Sun, 12 Dec 2021
 08:16:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] watchdog: rzg2l_wdt: Fix Reboot failed message
Thread-Topic: [PATCH 4/4] watchdog: rzg2l_wdt: Fix Reboot failed message
Thread-Index: AQHX7tXEPo6EUukcC0+yAJwH+PyYwqwt0bSAgACvJgA=
Date:   Sun, 12 Dec 2021 08:16:10 +0000
Message-ID: <OS0PR01MB59226E036A5A8910349ACB1B86739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-4-biju.das.jz@bp.renesas.com>
 <1f11fe7b-8b2d-1d64-d4ef-23ab890f9971@roeck-us.net>
In-Reply-To: <1f11fe7b-8b2d-1d64-d4ef-23ab890f9971@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6c2ec2b-62f6-4b7b-b1b2-08d9bd47a7d5
x-ms-traffictypediagnostic: OSAPR01MB4321:EE_
x-microsoft-antispam-prvs: <OSAPR01MB432157DBCBC04E38F7C5C1EB86739@OSAPR01MB4321.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8gm98Wkyol5ZK/y2bf9kvbyvKUgFPyVoqsHF7j1xj3GnP0JzwKVp+/BtsSztlL1FFRb8OeuhyecinvNODkXMO910e1/FozXv8vn3ZOaQutp1AZCCK9ko3osKNdoh5c0gsTLALMiAAkqFoVB+f7UkoGGcNH9Zm2NJ/S9xHwhGxUKFPQ92i/vgwgS+394XAM23H0SBSUi6YiopQTUD0RsPteIMpLgD2VFR07V4dyCheTuGzuUKX/S4nil9gFq5tTdf/D/eUQHmrDwX/5h6f8Eg9x6bHu+EGRvcQmIHzdcO0TYb0EmNsLdWRbHyV9C501cchLyEy5Ce5ks3kai8QKsFcvTavhB9wruHeY5jUDdVvQNMpaj6rsi6lZQU7vfHDMRwxu+Y7S3wGCgU4AkiFTRA1zzhO0qSk+Ue+fYDxNG8uQrJD/MACMGVFLjqHXZ+WCJZRAcYeOOcFMjn6tlU5uQoWltTrBpTOEbyDPDEsWAIfkdfJu3K4tmtF5V+qVBay5ydR9h/1K30I08kchwBTrx+VhuS6w6SVqmrC9a1JbapHbQvoPntNX5lF8iNPatPsI2nckKthJiMDiSG0QCCh7mhJAAafchQR3w/iW0MRPvKjS8SWzJZgYkScsVdZR9hFcQ0jPkv1x0TRAzxdqhDz2MC+V0qt/wE+HMhtLQWFucTHl8lLOjJxQeUlDgbTEsEv+4i03DUHJDvavtatU50UtYuIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(76116006)(2906002)(64756008)(38100700002)(4326008)(38070700005)(122000001)(186003)(52536014)(110136005)(5660300002)(26005)(316002)(66476007)(66446008)(7696005)(6506007)(53546011)(8936002)(83380400001)(71200400001)(508600001)(66946007)(86362001)(55016003)(15650500001)(33656002)(54906003)(8676002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cThvd2c3NE5tOWVjd3pETVI1SWFhWW5tRkg0b0lMMGsxV0NkMmJCNkttZDJi?=
 =?utf-8?B?dXN6TDVYNlVmMWhHRG9uQlFKTHpsaTVtaktPUUtGbnVNWm1lZ0x0ekpEUUxP?=
 =?utf-8?B?ZEpYYUxaUm5heklGVXdlZEI4WTZLdmUrNTJMczk5clJlY0s5THBHUGpoS2ho?=
 =?utf-8?B?MzgzaVFUVk52ajRMSmJJVElrN3hldDJhZnd5NlRobmJFT1BkajErQVBvdWx3?=
 =?utf-8?B?LzlJTnVTdGRZM21SaUJadmJBaGY0eldFM0FLam81K0xoV0VhS3ZoNHBBZW1O?=
 =?utf-8?B?UmhETlp4Ym1KSHcwVVhja3U0bXRKaTJLalBXZHpmTUI3U0NIclJyQmZveTln?=
 =?utf-8?B?enFEYjFvbFBqa3JpQTkzY25QUlRiQ21NSmM0V1VHNVlZQStpMHgvZ1lVWXlo?=
 =?utf-8?B?M05iK2FrbWI2MnRNeVM3TGNZQjBzaWhnSHdlZkp5VkYrYXRCVCtQbjNET04v?=
 =?utf-8?B?QW05ZUtCdnZ3Q0owNnZpWlBEdE10S3V6L2JlY0c1bEh1OXkzckxPazNkd1lx?=
 =?utf-8?B?emxRU01COUVMNWgvOTMvWk5xUEIyQXpXRWdnbC9iWU93N2lKb0Y1MXZjRnpT?=
 =?utf-8?B?UHJuVVBHZllsckRzdmVhTzVTV3NSeWNtU1NZSnZWNS9PUjVGY3RVN1VZYzdO?=
 =?utf-8?B?K2J6ZjlYSi8xZGE2VEZ0SEplZ3laWStjTWNYYUg4ZFA1RmNQSUo3QTU0S3pv?=
 =?utf-8?B?eEF4c3c4bVhLc09oN0tZWnA0c1liZ3VhbUk3eENUbVF1VytvYzFKOStTNjBI?=
 =?utf-8?B?UHhiWlA2WlBRYjQraTBpQzArUkJPZC83SUhIL1ZxSlI0ZUd3Lzl4OHExdTl0?=
 =?utf-8?B?R1EyR21ZTG0vMC96UFkreUQxb044RTlZMkhGeVFKTG5vR0VZNUpDQ3NJVXRR?=
 =?utf-8?B?NXllaUptSTR4eXIrSmZWcXhndENXYWJNdzRxRHN0ZkY2ZHZDY3lNelVWYVFp?=
 =?utf-8?B?VEtaRUNJb1NadWRPOXF0U1o1TW84NXZRWHRJa3MrK1hSN2ZqU0RUazZ0cWhZ?=
 =?utf-8?B?NzZBekpTK1dnNVF1NWo4dHZqODgra0hpSVBOa0h0NDFoNDlLcGJoRWlKSDVV?=
 =?utf-8?B?NTk0OE1nZ0taKzRWb3JDd1pVQ2xwQzgxK1ZBWStvTHJ4Yzg4Mk9mVUxXRmNI?=
 =?utf-8?B?YkpRblhFUWpIdzhXRXNtOSs4ZWI1WHVzOTgzTURoNVliNnVXTEQ1eWgvTDJU?=
 =?utf-8?B?WHk4NXpOUC9ERGtPR0tBRUNycWNVT0JXWXpVUXFyYnROTmNVbjhVc3lwYUlh?=
 =?utf-8?B?aWtHdXBpUGN6LzBtOEhYaUlNeWhWRXBNRDJwTDcxYVR5bFZwbEIrTUpjT3Rp?=
 =?utf-8?B?Rnd2ak41dURuTmxBb3pPdmFDWG5SZm9NQjBiN3pjK01sbmp2a0crdFpVU1d3?=
 =?utf-8?B?RkR6Z09wM2FlcHpYSGx1VXpJU3FBeHN5QnJtU1hKMWUyc1J1ZjhmMHFPbW52?=
 =?utf-8?B?eVlRdXFRNnl5SStxRy9rUTZDc1ZyOTU3eVhWTE9EVnU1MURlOEZCUDlCZXZ1?=
 =?utf-8?B?ZDlFUVJmdlF3UThmVGRrbndIYzZjQjduM2tpWlhFczNYcW1oWUVsTE93dThF?=
 =?utf-8?B?bXJxMFhVbHBsNWgzVittRWV4RWppc3hKejRjUHRrQVB6QzNveEtuanVWb3Jn?=
 =?utf-8?B?TkNhcGVlbkNma3ZUYUthNmpHdEJabUdjN1RJLytnRGxkK1VJZFNuZlBXTjUw?=
 =?utf-8?B?dFQ4N1BmaW5pZVhoc28wQm1iVEJURUE4ZzUxVXFKQUthYWowYWhrK1lxbWhh?=
 =?utf-8?B?UlBleHlMWUVXSUpjTFVuaGpWcElrR2N1NGk2TWp1ZzRaZDB1S0FIR0xCUmY2?=
 =?utf-8?B?ZkZNNDRTRG1EQmNpbDVMVWZBNXREUHROSEtSaldUMTRLU20wekx3VVRIWVJj?=
 =?utf-8?B?bWw5MkRKRFB6UHBPdzlFZXA5cVUyVG5TRitreHJLclM4dHlKTThXMDk2MGNh?=
 =?utf-8?B?RjBtWllRM0dQQmxrRHdrL0dlMzNpSm0vSTYrQXJ4RTh2NnZEOTlDQ0dZNjZE?=
 =?utf-8?B?bERvcXIvVkVyNTE1T2ZKS0hiOW1KR3J0cW03NDRKKzFtMmljcUQ5UGFwVThU?=
 =?utf-8?B?R2ZkWGdJaHlpeUxVMzBDNUtCZjVWUnBOZzZtMmorays2NXp1Vjl3R0Y0WHZt?=
 =?utf-8?B?WnJYbCtQRGY0RWoxTG16cThnS0Q4NSt2ZmpRNUVGaGMrVmdLaEZseDJQeVJ5?=
 =?utf-8?B?MDJ0UkZYWWhDd3VPS0hLYjR0SmlNK0pobGtBWnhKVTM0ZVFyaUZRODZiWWln?=
 =?utf-8?B?cnBUZTUwTWJZTkpmWm5GU0RsTkxBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c2ec2b-62f6-4b7b-b1b2-08d9bd47a7d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2021 08:16:10.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SshB8Kx8O1/m7HMnPg7gyyslPgtUuuIbCjS5qt5XLBFuT8V0qJT+vMzsany7xgTHoGAHv3XKYIUbn7rcoJFDodIU1RGslw4NzmY/z+vrZag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4321
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCA0LzRdIHdhdGNoZG9nOiByemcybF93ZHQ6IEZpeCBSZWJvb3QgZmFpbGVkIG1lc3Nh
Z2UNCj4gDQo+IE9uIDEyLzExLzIxIDE6MjYgUE0sIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoaXMg
cGF0Y2ggZml4ZXMgdGhlIG1lc3NhZ2UgIlJlYm9vdCBmYWlsZWQgLS0gU3lzdGVtIGhhbHRlZCIN
Cj4gPiBieSB0cmlnZ2VyaW5nIFdEVCByZXNldCBieSBlbmFibGluZyBmb3JjZSByZXNldChXRFRS
U1RCKS4NCj4gPg0KPiANCj4gVGhhdCBpcyByZWFsbHkgbWlzbGVhZGluZy4gVGhlIHBhdGNoIGRv
ZXMgbm90IGZpeCB0aGUgbWVzc2FnZSAtIGl0IGZpeGVzDQo+IHRoZSByZWJvb3QgaGFuZGxlciB0
byBtYWtlIGl0IGFjdHVhbGx5IGV4ZWN1dGUgdGhlIHJlYm9vdC4NCg0KVGhlcmUgaXMgc29tZSBk
ZWxheSh+MzQgbXNlYylpbiByZWJvb3QgaGFuZGxlciwgbWFrZSB0aGlzIG5vaXN5IG1lc3NhZ2Ug
dG8gYXBwZWFyIGluIHRoZSBrZXJuZWwgbG9ncywNCmJlZm9yZSB0aGUgcmVib290IGhhbmRsZXIg
dG8gYWN0dWFsbHkgZXhlY3V0aW5nIHRoZSByZWJvb3QgZHVlIHRvIHdhdGNoZG9nIHJlc2V0Lg0K
DQpUaGlzIGlzc3VlIGlzIHZhbmlzaGVkIGJ5IHVzaW5nIG5ldyBmb3JjZSByZXNldCBtZXRob2Qu
DQoNCk1heSBiZSBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgaGVhZGVyIGFuZCBkZXNjcmlwdGlv
biBhcyBVc2UgZm9yY2UgcmVzZXQgbWV0aG9kDQpmb3IgV0RUIHJlc2V0Lg0KDQpSZWdhcmRzLA0K
QmlqdQ0KDQoNCj4gDQo+IEd1ZW50ZXINCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy93YXRj
aGRvZy9yemcybF93ZHQuYyB8IDIxICsrKysrKystLS0tLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IGIvZHJpdmVycy93YXRj
aGRvZy9yemcybF93ZHQuYyBpbmRleCBjODFiOWRkMDVlNjMuLjQ5N2M4NjEyOWYyMCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gKysrIGIvZHJpdmVy
cy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IEBAIC0yMSw4ICsyMSwxMSBAQA0KPiA+ICAgI2Rl
ZmluZSBXRFRTRVQJCTB4MDQNCj4gPiAgICNkZWZpbmUgV0RUVElNCQkweDA4DQo+ID4gICAjZGVm
aW5lIFdEVElOVAkJMHgwQw0KPiA+ICsjZGVmaW5lIFBFQ1IJCTB4MTANCj4gPiArI2RlZmluZSBQ
RUVOCQkweDE0DQo+ID4gICAjZGVmaW5lIFdEVENOVF9XRFRFTglCSVQoMCkNCj4gPiAgICNkZWZp
bmUgV0RUSU5UX0lOVERJU1AJQklUKDApDQo+ID4gKyNkZWZpbmUgUEVFTl9GT1JDRV9SU1QJQklU
KDApDQo+ID4NCj4gPiAgICNkZWZpbmUgV0RUX0RFRkFVTFRfVElNRU9VVAkJNjBVDQo+ID4NCj4g
PiBAQCAtMTMwLDIyICsxMzMsMTIgQEAgc3RhdGljIGludCByemcybF93ZHRfcmVzdGFydChzdHJ1
Y3QNCj4gd2F0Y2hkb2dfZGV2aWNlICp3ZGV2LA0KPiA+ICAgCQkJICAgICB1bnNpZ25lZCBsb25n
IGFjdGlvbiwgdm9pZCAqZGF0YSkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgcnpnMmxfd2R0X3By
aXYgKnByaXYgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPiAtCWludCByZXQ7DQo+
ID4NCj4gPiAtCS8qIFJlc2V0IHRoZSBtb2R1bGUgYmVmb3JlIHdlIG1vZGlmeSBhbnkgcmVnaXN0
ZXIgKi8NCj4gPiAtCXJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cnN0Yyk7DQo+ID4g
LQlpZiAocmV0KSB7DQo+ID4gLQkJZGV2X2Vycih3ZGV2LT5wYXJlbnQsICJmYWlsZWQgdG8gcmVz
ZXQiKTsNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+IC0JfQ0KPiA+ICsJLyogR2VuZXJhdGUgUmVz
ZXQgKFdEVFJTVEIpIFNpZ25hbCAqLw0KPiA+ICsJcnpnMmxfd2R0X3dyaXRlKHByaXYsIDAsIFBF
Q1IpOw0KPiA+DQo+ID4gLQlwbV9ydW50aW1lX2dldF9zeW5jKHdkZXYtPnBhcmVudCk7DQo+ID4g
LQ0KPiA+IC0JLyogc21hbGxlc3QgY291bnRlciB2YWx1ZSB0byByZWJvb3Qgc29vbiAqLw0KPiA+
IC0JcnpnMmxfd2R0X3dyaXRlKHByaXYsIFdEVFNFVF9DT1VOVEVSX1ZBTCgxKSwgV0RUU0VUKTsN
Cj4gPiAtDQo+ID4gLQkvKiBFbmFibGUgd2F0Y2hkb2cgdGltZXIqLw0KPiA+IC0JcnpnMmxfd2R0
X3dyaXRlKHByaXYsIFdEVENOVF9XRFRFTiwgV0RUQ05UKTsNCj4gPiArCS8qIEZvcmNlIHJlc2V0
IChXRFRSU1RCKSAqLw0KPiA+ICsJcnpnMmxfd2R0X3dyaXRlKHByaXYsIFBFRU5fRk9SQ0VfUlNU
LCBQRUVOKTsNCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+DQoNCg==
