Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCC345590C
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 11:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243696AbhKRKcE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 05:32:04 -0500
Received: from mail-os0jpn01on2090.outbound.protection.outlook.com ([40.107.113.90]:24897
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243409AbhKRKcB (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 05:32:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdPgWhMsuMuQEd5llt37uingjVEWcHdbyU+91ecZTzgorJYPPw2iVjQ8MXFvuigAHpxdav3AXI8zeKdHe0BrA73mlb0NvYC6pF0C9ac4HNVERFLYgCGzToF250tdug9gesuJgRlEc6vJWlFdrVgJV/AE36g68uWEOoJ1O1tRdoj7VErFBIieNnYGR0tTBht0yMMyYshLPJY0TCtv1rtKM4YAb5litB350njlnO52SGypULWAr/Ygqj/2GNDjsLpSPNzuclctmakpIJREEK6I1yM7LVeqwewLZRzS0+wN/VeqkV3cJ8psT9zbTYV7N41ZGNpwRrgLYH3yqctXcijNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeS3xeMVAO7P9ILPGSqFlSOHfdMU9XNu3iZROT/UDhA=;
 b=i2mzs5VgL4ByXnlX5ucsUotvEbhc36FMOmKlPFqM7Il7sRgGbrZ2O7I2R+HUbRluAM+5E8HFrpQAnugf6OmKPCei0PSmqBohfjrl/MaMvW9msh4ldXlp6sQXp3VIr5I1mhJfG0bK3PEECzOxYonqIKT/xB0QKkhwmGy7//OfVw9fd/qrZuH7o2OV4L9xA5ilE9b1TOYXcjCjdH4BC921WOBsPBUUf+nwEeaxNWT+6WBZtPXw4OMAAXfs9AnL7sr5pUb2eMk2Jn6njlN/8HBu9QAvT7we5AoO1200xrLGRhA7Ie+zEfrrYhnogljcIN1bIZlEWPaANu1u1CwHd/9Aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeS3xeMVAO7P9ILPGSqFlSOHfdMU9XNu3iZROT/UDhA=;
 b=st1xMucB+JV2t+8uK361uUhtdl9PIkT+GxuWyend8KMdbmH3yjDJ8Qzl2UQzXmR/nkT4e8icVQN8YhT7nLcAo1/gd7PVIWFqqwA1u11O/JH2/VcoBSgRxdwRJQZ3vwMHWQGf5JKqISYYFMNLznFUkY9bXu3qQOckcYwlNQAUiB0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2996.jpnprd01.prod.outlook.com (2603:1096:603:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:28:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 10:28:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Topic: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Index: AQHX1vLnlfB1SUBaW0CHFGqbJXktJKwJBUYAgAAF/UA=
Date:   Thu, 18 Nov 2021 10:28:54 +0000
Message-ID: <OS0PR01MB5922FB6211306DCD53C1F145869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUxNFamJznWVrFNNm21P=hP9btibSN7NSh43O8AK4MLOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUxNFamJznWVrFNNm21P=hP9btibSN7NSh43O8AK4MLOQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc43ceb3-deee-4de9-ba1f-08d9aa7e391a
x-ms-traffictypediagnostic: OSAPR01MB2996:
x-microsoft-antispam-prvs: <OSAPR01MB2996325A96547D74C6573828869B9@OSAPR01MB2996.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vQHs8reO6QoJo9ITqV+Rv+DWforvn3WjVkGCBnzkL20DRxB4XUhdjdwTPJ4K+Dk6JqFL+w+Qx2Cwtcyc3yuil6aQ5U0skEMmwf7a4Q5iDtxgORBHuVm2cuKtOQVCG24xSlA4Krd0+WKq9cFTpVabQyYBdZVizw0Kp0mJ+V4SyvIOd/X+e6Z1kJtz7fQdRfbietj2wcyH4iFHyUYhg4tsqjppYdq4yJO3PvtClzcJwOeJTc7Xg+CsGd+DIq5Ul6qY+C8VAB3bkEgD7kfOy5l+eUqWWbXLvIfRYUuWWYRtZqiuzsenoFEXyj8xH1pBRL4DvcN/vzb++GNcCJaNSJt0umOxffHfNqjhhwwYq7KXJzndjGdZlQHUsmcvoGBXvLMfyboLA7y2E1FjUazehyegZ10LcZnTNs/240gWMT81X6CZuPxhtFet4q4R2QV/ZwgnuwQ4ZNM/+SM+LbiFpeb5yisD1U6HB9TyPqFFmbza03nuxb1UkPIdOKgbMAyawGAr6l+k+TKIJqe6084bxfTfc+QYsAMRzU3HtFt3KUyx2kXjin+dr0OU5X3vhxzEmqsnu5A9gORZlKl5Ziubna5lNBRHlmk3sJnGZc54q4+PdYue+j0ILCcXa+RFUmndSPBucM1M6DrcLZesd+092/Tkz1lBazJ42+tR66bv4eWVm4SzXOoGM81uI+Vv+jOlIELRDe1eot+WUMZPGLuboNJ2g/65Kt3HllLddR0Xs2uVgCw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(64756008)(5660300002)(66476007)(38100700002)(55016002)(52536014)(66556008)(66446008)(2906002)(53546011)(8936002)(83380400001)(86362001)(9686003)(76116006)(6506007)(8676002)(6916009)(26005)(66946007)(38070700005)(7696005)(71200400001)(33656002)(316002)(122000001)(107886003)(508600001)(4326008)(54906003)(171213001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3Ezdno1akxrODExOXJPVTJFeTF2eE9TVDVWcVNPYVhuUlRQRGNRTVZwTjh2?=
 =?utf-8?B?TFloOUdVTWI1SXphSWd5dEtMd0RBU1J2eVlkcnBMaHE2T3RLam5Qa3Q4MFdl?=
 =?utf-8?B?YTlKeDFxMHZDR2gvK1JnbnpzaHljZHRmK1NaNjlZRUZMNzQxN0I0MDE4alM3?=
 =?utf-8?B?RE1yQzBFNHB4SUVsVUlFSFFGZG9yb3R6TXIxTkxPWmVINlQrdmpVcnROZ3h6?=
 =?utf-8?B?WVRLV3lWZEs1cUl2WktobWt0K2p3bnl3ZE9MQ3ZvN3VYdWZkVlFLamQxZGxm?=
 =?utf-8?B?N3d3c3VuZzVNbWlReVhhcHM0MkNKeVV6SEo2L1BCd08yWnNYamNFaVJMV0Yr?=
 =?utf-8?B?OVRySmVoSHVBQUt3cDVmN0xoZ0s0MUNSSWVLODdHRDhJRm5BYTQ5cFMzM3gy?=
 =?utf-8?B?REwxN0VDQ0lUZWFHRTBhOTVjZWQ3WGxSanhMWXkvMjVjblhKazU5bHV0cUZN?=
 =?utf-8?B?dFovempoTnk1eXFaT2xjS2tQRmVvY1kxN0hrbStqdWNGbDlxeWtjWXMzWmt0?=
 =?utf-8?B?bVFZMG81TXQ3RlIxYy9uNXFSU2Vkek82S3VuejBSQTJZZjIrZ3Evclg5VUpG?=
 =?utf-8?B?SGQ3Y2Z4YlMyWkZ5MEt0SGgyNEErMnpBTFFiZGNrU2ZaZCsxcVFBdTB0eWIz?=
 =?utf-8?B?ZWJXb0NtQmJQckRCTFlueS9ybWd2M0NhbzlaSXBlNUx0L3pRajFWbmJFYk5j?=
 =?utf-8?B?S25RWmJZMG1IckY1N3I2b1NJN05UU0JXQ2QraXpPdWpzd0I5N2ZVajlMTzZV?=
 =?utf-8?B?RWNtUEo4anNrMlJsa1BVY0JDRDNBS2xocFB5QVhJa2NaRUM5UG44dXVZZkdE?=
 =?utf-8?B?VFRwZGtnYm5jN04zT3lCd3VXRUxuZEN4clgwMDhKM052WSthMmtOQkVVVUEy?=
 =?utf-8?B?eTV2R25uWWNSempGYU9kY2RBdllMUkZoV2kyNGZicUdYaWp1elRod2gwdmJr?=
 =?utf-8?B?c05yMFNhOUZwUDdRVG81SlNwYjJrb0pnbmxIR1Y2cjBWUFRyaTFDb3AzOFlE?=
 =?utf-8?B?QkZxdVc0MTVZSXY1U2QxM3FCVmY3MVRTRng4ZWRsYkJJbk1TOXh0cjNxQmZh?=
 =?utf-8?B?QUhrNW5NTUR2c1NOUGg2M3VaQUk5OENvc3phbm9lVnJaYmlzSmNDZG5rUWtW?=
 =?utf-8?B?a05MK2hJaWpOZTJNL1o4a2NlbW43RXN3OFpKSTdJZ3BXeEdHZXRncU5lMVlI?=
 =?utf-8?B?T3ZUc0ZEbXJpTEpJczBxdFRIUWt2aTJDZDlEdTgxWGFpUEFIRXhFU0NSVjdk?=
 =?utf-8?B?VEdBbU91SnBOTlBRRmtYK2tJcHhJa0NSM0g1dEFjM3EyRjZ4bUVPL2tpNENz?=
 =?utf-8?B?ZWxRSTRmbE9jZlIreFlYWXlVSjJKRWE4TmEzK2diLzlZUm1sek9YRVpjZ2oz?=
 =?utf-8?B?TGxrc0xSVVo0ZVNkTktUcmhZZ2w5UG1LYk9NRWlleDVTOVN1bnhsVFBrVkhT?=
 =?utf-8?B?dE0vTGcwV21PV0dIMHc1ei80bEdnTjN1QThDL0tIZnI5ZzhlakMrcVlHU2NL?=
 =?utf-8?B?RE9udWY4OEpCbTFaMjhxbWN3Q3hQanZDV1F5cGdiZjFQTVlSTjNxaEZnMFBm?=
 =?utf-8?B?RE1jaGhJdnRBNWFwN09DUWcxZkFBcXc0MG9uOGZXbWtnbThhRjZMU05CR3J4?=
 =?utf-8?B?R2ZrNllpWldMcDd1ZHhJYU5jdWlVV1RFaWVNQm03UVNjNUp3TzhvRFhzYkVJ?=
 =?utf-8?B?c042RkFEdzgwaUJCRzBuaHIzWlA3bjhaODkxQ2JKa3VMRVdYczlRTTMzWnVm?=
 =?utf-8?B?UXhUa3J1MGs4bnhtL1BhUmhtNTI2eUxoR1h2NFhpQStQelg3bEJrakZRTnN5?=
 =?utf-8?B?ZDBpZlRvSC9FaXZ1VzhQOXFzenNuVmhYUmd1cjZEdkNYTit1RUFDbW11bHM2?=
 =?utf-8?B?Z2NPQXRZUldCU2g2MDVzTkRrb3FtM040UVB5bmRHZ0lJNWpaRXlmQ1VPUVFr?=
 =?utf-8?B?OEQ3ZDNlOGdPZGU4WkxoRXlCUlZ5TVpJR3haL0dOMG55UUxHQ1UzQXZ0R3Bp?=
 =?utf-8?B?RGhHWi95MmdQM3BIeHExRXU5Z1ZEM0ZwaTRxNUpkWjJpcXNEYTNwUmw0Z3A3?=
 =?utf-8?B?VXhrMENoTWE4Q3J3UW5RYlJ4ZDhDeGtHMURRdkt5YnN0Q1J0OC9ISlhvWGgv?=
 =?utf-8?B?YXU0OTE2U2M5cHk5cEpOVzZuVFhpOHp0bUtyVmlCY3J4NmlyNUNXeGJnWmNa?=
 =?utf-8?B?alFrY2Y2NDJwRnkxT3V3YWprNFNJbEw2RGsvOGgwQThkY29pQ1hNNEl4VEY4?=
 =?utf-8?B?Sm5DZ0pnSjF1a0dlMUN0bFlIS3RnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc43ceb3-deee-4de9-ba1f-08d9aa7e391a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 10:28:54.8786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkF2XnXMeJeve8YIq7LdTMpDASu26BA8Ad/E+V6bkswk6A6BdtbSaWc8jTK7WAV62ggwRopHZd/9gOVs6nhrYtdy/i3lYG4psgFnGJP4TGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2996
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAxLzNdIGNsazogcmVuZXNhczogcnpnMmw6IEFkZCBzdXBwb3J0IGZvciB3YXRj
aGRvZw0KPiByZXNldCBzZWxlY3Rpb24NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBUaHUsIE5vdiAxMSwgMjAyMSBhdCAxMjo1NCBQTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoaXMgcGF0
Y2ggYWRkcyBzdXBwb3J0IGZvciB3YXRjaGRvZyByZXNldCBzZWxlY3Rpb24uDQo+IA0KPiBQbGVh
c2UgZXhwbGFpbiB3aGF0IHRoaXMgcGF0Y2ggcmVhbGx5IGRvZXMsIGFuZCB3aHkgaXQgaXMgbmVl
ZGVkLCBpbnN0ZWFkDQo+IG9mIHJlcGVhdGluZyB0aGUgb25lLWxpbmUgc3VtbWFyeS4NCg0KT0sg
d2lsbCBkby4gQ1BHIElQIGJsb2NrIGNvbnRhaW5zIDIgV0RUIHJlZ2lzdGVycy4gMSkgV0RUIHJl
c2V0IHNlbGVjdG9yIGFuZCANCjIpIFdEVCBPdmVyZmxvdyBzeXN0ZW0gUmVnaXN0ZXIuIA0KDQpG
b3JtZXIgb25lIGlzIHVzZWQgdG8gbWFzayByZXNldCByZXF1ZXN0cyBmcm9tIFdEVCBhbmQgdGhl
IGxhdGVyDQpPbmUgdXNlZCB0byBjaGVjayB0aGUgV0RUT1ZGIHN0YXR1cyBhbmQgY2xlYXJpbmcu
DQoNCkNQRyBJUCBhbmQgV0RUIElQIGFyZSBpbiBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZS4gVGhl
IG9wZXJhdGlvbiBpbnZvbHZpbmcNCldEVCByZXNldCBzZWxlY3RvciwgaXMgYSBjb25maWd1cmF0
aW9uIG9wZXJhdGlvbiwgd2hpY2ggd2UgY2FuIGRvDQppbiBDbG9jayBkcml2ZXIgd2l0aG91dCBh
bnkgZGlyZWN0IGNhbGwgZnJvbSBXRFQgZHJpdmVyIHRvIENQRy4NCg0KV2hlcmUgYXMgT3BlcmF0
aW9uIGludm9sdmluZyBXRFQgT3ZlcmZsb3cgc3lzdGVtIFJlZ2lzdGVyLCBuZWVkcyB0bw0KYmUg
ZXhwb3J0ZWQgdG8gV0RUIGRyaXZlciwgYXMgaXQgbmVlZHMgV0RUT1ZGIHN0YXR1cywgc28gdGhh
dCBJdCBjYW4gc3VwcG9ydA0KV0RJT0ZfQ0FSRFJFU0VUIG9wdGlvbi4NCg0KPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+
IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDdnMDQ0LWNwZy5jDQo+ID4gKysrIGIvZHJp
dmVycy9jbGsvcmVuZXNhcy9yOWEwN2cwNDQtY3BnLmMNCj4gDQo+ID4gQEAgLTI5NSw3ICsyOTYs
MjggQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByOWEwN2cwNDRfY3JpdF9tb2RfY2xrc1td
DQo+IF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAgICAgTU9EX0NMS19CQVNFICsgUjlBMDdHMDQ0
X0RNQUNfQUNMSywgIH07DQo+ID4NCj4gPiArI2RlZmluZSBDUEdfV0RUUlNUX1NFTCAgICAgICAg
ICAgICAgICAgMHhiMTQNCj4gPiArI2RlZmluZSBDUEdfV0RUUlNUX1NFTF9XRFRSU1RTRUwobikg
ICAgQklUKG4pDQo+ID4gKw0KPiA+ICsjZGVmaW5lIENQR19XRFRSU1RfU0VMX1dEVFJTVCAgKENQ
R19XRFRSU1RfU0VMX1dEVFJTVFNFTCgwKSB8IFwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBDUEdfV0RUUlNUX1NFTF9XRFRSU1RTRUwoMSkgfCBcDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQ1BHX1dEVFJTVF9TRUxfV0RUUlNUU0VMKDIpKQ0KPiAN
Cj4gWW91IG1pZ2h0IGFzIHdlbGwgdXNlIEJJVCgpIGRpcmVjdGx5LiBPciBHRU5NQVNLKCkuDQoN
Ck9LLg0KDQo+IA0KPiA+ICsNCj4gPiAraW50IHI5YTA3ZzA0NF93ZHRfcnN0X3NldGVjdCh2b2lk
IF9faW9tZW0gKmJhc2UpIHsNCj4gPiArICAgICAgIHdyaXRlbCgoQ1BHX1dEVFJTVF9TRUxfV0RU
UlNUIDw8IDE2KSB8IENQR19XRFRSU1RfU0VMX1dEVFJTVCwNCj4gPiArICAgICAgICAgICAgICBi
YXNlICsgQ1BHX1dEVFJTVF9TRUwpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2NwZ19zb2Nfb3BlcmF0
aW9ucyByOWEwN2cwNDRfY3BnX29wcyA9IHsNCj4gPiArICAgICAgIC53ZHRfcnN0X3NldGVjdCA9
IHI5YTA3ZzA0NF93ZHRfcnN0X3NldGVjdCwNCj4gDQo+IEFzIHlvdSB1c2UgYSBmdW5jdGlvbiBw
b2ludGVyLCBJIGFzc3VtZSBkaWZmZXJlbnQgU29DcyBuZWVkIGRpZmZlcmVudA0KPiBoYW5kbGlu
ZywgYW5kIHlvdSBjYW4ndCBqdXN0IHN0b3JlIGUuZy4gYSBiaXRtYXNrIG9mIGJpdHMgdG8gc2V0
IGluIGluZm8/DQoNCkN1cnJlbnRseSBJIGFtIG5vdCBzdXJlIGFib3V0IFJaL0cyVUwsIHNpbmNl
IGl0IGhhcyBzaW5nbGUgQ29yZS4NClRoYXQgaXMgdGhlIHJlYXNvbiBmdW5jdGlvbiBwb2ludGVy
IEludHJvZHVjZWQuIEZvciBSWi9HMntMLExDfSBpdCBpcyBzYW1lLg0KSSB3aWxsIGRyb3AgZnVu
Y3Rpb24gcG9pbnRlciBhbmQgc3RvcmUgaXQgaW4gYml0bWFzayBvZiBiaXRzLg0KDQo+IA0KPiAN
Cj4gPiArfTsNCj4gPiArDQo+ID4gIGNvbnN0IHN0cnVjdCByemcybF9jcGdfaW5mbyByOWEwN2cw
NDRfY3BnX2luZm8gPSB7DQo+ID4gKyAgICAgICAub3BzID0gJnI5YTA3ZzA0NF9jcGdfb3BzLA0K
PiA+ICsNCj4gPiAgICAgICAgIC8qIENvcmUgQ2xvY2tzICovDQo+ID4gICAgICAgICAuY29yZV9j
bGtzID0gcjlhMDdnMDQ0X2NvcmVfY2xrcywNCj4gPiAgICAgICAgIC5udW1fY29yZV9jbGtzID0g
QVJSQVlfU0laRShyOWEwN2cwNDRfY29yZV9jbGtzKSwgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3Bn
LmMNCj4gPiBpbmRleCBhNzdjYjQ3Yjc1ZTcuLmY5ZGZlZTE0YTMzZSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsv
cmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBAIC05MzIsNiArOTMyLDEyIEBAIHN0YXRpYyBpbnQg
X19pbml0IHJ6ZzJsX2NwZ19wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiA+ICAgICAgICAgaWYgKGVycm9yKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7
DQo+ID4NCj4gPiArICAgICAgIGlmIChpbmZvLT5vcHMgJiYgaW5mby0+b3BzLT53ZHRfcnN0X3Nl
dGVjdCkgew0KPiA+ICsgICAgICAgICAgICAgICBlcnJvciA9IGluZm8tPm9wcy0+d2R0X3JzdF9z
ZXRlY3QocHJpdi0+YmFzZSk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChlcnJvcikNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7DQo+ID4gKyAgICAgICB9DQo+ID4g
Kw0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5oDQo+ID4gYi9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6ZzJsLWNwZy5oIGluZGV4IDQ4NGM3Y2VlMjYyOS4uZTFiMTQ5NzAwMmVkDQo+ID4gMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmgNCj4gPiBAQCAtMTU2LDkgKzE1NiwyMCBAQCBz
dHJ1Y3QgcnpnMmxfcmVzZXQgew0KPiA+ICAgICAgICAgICAgICAgICAuYml0ID0gKF9iaXQpIFwN
Cj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IHJ6ZzJsX2NwZ19z
b2Nfb3BlcmF0aW9ucyAtIFNvQy1zcGVjaWZpYyBDUEcgT3BlcmF0aW9ucw0KPiA+ICsgKg0KPiA+
ICsgKiBAd2R0X3JzdF9zZXRlY3Q6IFdEVCByZXNldCBzZWxlY3Rpb24gICovIHN0cnVjdA0KPiA+
ICtyemcybF9jcGdfc29jX29wZXJhdGlvbnMgew0KPiA+ICsgICAgICAgaW50ICgqd2R0X3JzdF9z
ZXRlY3QpKHZvaWQgX19pb21lbSAqYmFzZSk7IC8qIFBsYXRmb3JtDQo+ID4gK3NwZWNpZmljIFdE
VCByZXNldCBzZWxlY3Rpb24gKi8NCj4gDQo+IERvIHlvdSBwbGFuIHRvIGFkZCBtb3JlIG9wZXJh
dGlvbnM/DQoNCkFzIG1lbnRpb25lZCBhYm92ZSwgSSBhbSBkcm9wcGluZyBmdW5jdGlvbiBwb2lu
dGVyIGFuZCBnb2luZyB3aXRoIGJpdG1hc2suDQoNCkFub3RoZXIgT3BlcmF0aW9uIHRvIGJlIGFk
ZGVkIGluIGZ1dHVyZSBpcyB0byBleHBvcnQgV0RUT1ZGIHN0YXR1cyB0byBXRFQgZHJpdmVyLiAN
ClNvIHRoYXQgdGhlICBXYXRjaGRvZyBkcml2ZXIgd2lsbCBnZXQgbGFzdCBib290IHN0YXR1cyBm
cm9tIENQRyBJUC4NCg0KQnV0IGN1cnJlbnRseSwgSSBndWVzcyB3ZSBjYW4gZG8gdGhpcyBvbmx5
IHdpdGggZXhwb3J0ZWQgQVBJPz8NCkRvIHlvdSBoYXZlIGFueSBvdGhlciBzdWdnZXN0aW9uIGFw
YXJ0IGZyb20gdGhpcz8gUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpSZWdhcmRzLA0KQmlqdQ0K
