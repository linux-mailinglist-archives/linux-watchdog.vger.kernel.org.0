Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89254499F8
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 17:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240013AbhKHQgm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 11:36:42 -0500
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:26944
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238873AbhKHQgl (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 11:36:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVC0g3HUmcyYaKfnZ166MXmv6Bb2PHdTyRIySV3xiGptNXOILLnsw9XmhBDkjg+D67d7mrlXsApF1s4YUtxOJ1lv/F8Z4JrZRG5k3JdGiUOxpfnHdE5TGefjNg5geZfwITRBkyvK9VfCF9xlFPF1CTNQYaGgwsKSPwajDkgrjxmm3J5JqAByrATA+6LVHJ5vuwUhn1fAsjELNPSKAGSjaeCCjP2Z+ad7R7nQIFbvpQZb3YQc/sYCQ+VhHt9jyikvPJP1P012r2l1BzLRyyDO2fZyobQ8Dqi8JIV7CRz2EpsL0sLgSAdsNvrgJK4xZOkoCPfZnHRd613en63W4emiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOCPl+5jZijD1pIroLS6bhNLQhGMMCGe1NN2k0PKHA4=;
 b=Wnw7LPqbBjI5KlLkvlSwN35+eOSN84oob7pHXoUsXBFmSsYH8IzI/YKufhNF9kR6kqL9JccccrzpHwz10pKjNra1IMtIPlCMsj4JMqmj3vego3KKqYsgzews7GL6lDvcSRcND4k+mHE+dhJc0J7aIDKfz6oOANLbtlDivShRwvf4PZH3MxReZt+0zGvbJhLht/2WPWzfzzImhVt8ysIEJEzqVGwsc9m6kfkOxWPX1PbYa2h3dzVDhH0XMmrMEY/WnH/yxv4wT/kdy0J1YEXOqMvjeAU8rhIEw9fkdJGgx6M4EnAD0J1pHnnxPjkAJrEvLjbO131MVka0VVjVUhKwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOCPl+5jZijD1pIroLS6bhNLQhGMMCGe1NN2k0PKHA4=;
 b=Aih024xMRspikKQtiEAEAEfl/ovDyLpbGPujmxMq5933wZd292a84gKpxTTT3v45qLcjg3L+je2eedbjy/YRHMl6OAy+5Q+aTfjThyNTugqNNVwB4gE3nNgVq7O98MBRvruWXoIG71zyjQkltq9ofRvW8sFLf8gxrwigXWbiQZI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 16:33:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 16:33:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC 2/4] dt-bindings: watchdog: renesas,wdt: Add support for
 RZ/G2L
Thread-Topic: [RFC 2/4] dt-bindings: watchdog: renesas,wdt: Add support for
 RZ/G2L
Thread-Index: AQHX0ZZNHOtq05IgGUCn6i3dBHS8Qav50YMAgAAHpYA=
Date:   Mon, 8 Nov 2021 16:33:51 +0000
Message-ID: <OS0PR01MB5922BD0EB1CEC3CFDE6C0AD486919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
 <20211104160858.15550-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUj0Pd6ca3ma2c6C2n9t578KBRx+GdPEQnHPa3p9A0bvw@mail.gmail.com>
In-Reply-To: <CAMuHMdUj0Pd6ca3ma2c6C2n9t578KBRx+GdPEQnHPa3p9A0bvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 263643b6-76eb-42a7-3f05-08d9a2d58cc3
x-ms-traffictypediagnostic: OSBPR01MB5048:
x-microsoft-antispam-prvs: <OSBPR01MB50485103A328EA4C45158B4786919@OSBPR01MB5048.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y8rzD8y4y2wnLhZkWeQKsW6+16IwuEtW7Nw+SUY6T40U5ElzX4vGBzDdSoBx4oQOxsjF9S4fjjr9qEPSagC8smlm7MRF4XdNTiRpkEs/Xq0ZeyMRZK2swS5fEXb19nsC1hmVqM0UcfDGQ6xtmG3hxwo9JtTBFHEgh/9rea8AySaThapFu1+EfDycokFc+SRq4n0fJYxSBGjgEHFBUzolNthzQQlkKgWrwQ/YUW/PWem6ZjMSt7W/eG96X5pLS2EYeh6dd3H/9o3Assgg6BDmS3WaDytpl/RKkA2FyWbVXGYC+R3WISCVh15Plouf/XElFdZnHjhDmWuPdNGWQhEQmEnFhdkq8ngqVLGXdqvf5M0MCFq6UgeB0VzzsmClmkWsytTk6ZyeZ9V4APrbij7UsTpIKEEVSUQBGeHV0KDInJrWvXKCgS/XU2F3L0vmCnphsF0zUns3hRnSoY/Nbgpdk4UE7zVUSflV27CICkSdeRNexOH4F317ma+2iqQxXaow1qGb3aqLPikcZtnzIaKy6m4KNe96hdZqjoOKoZdw/ppcAxizPrwT6GyLc5nMx+p39iBWvkDf9PkFFjh7S1pBofa5qi/Gqd6ICMDOgU4bryZD5zyMv67S5pkhnTkzeRhz4UgDdR/LfocO4TReV61ukh28WxKMxsQo46dH8OYu8YS2K/LeusTpnd6x6orQ/Eq4pNfYgyh6pYrn68ZyAEfdNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(316002)(8936002)(5660300002)(55016002)(4326008)(7696005)(8676002)(71200400001)(64756008)(66476007)(66446008)(66556008)(86362001)(9686003)(66946007)(122000001)(54906003)(76116006)(6916009)(38100700002)(508600001)(52536014)(2906002)(38070700005)(33656002)(83380400001)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWdkNU5UM0lObUx6TFlmWTFYYWVnTkpmN3QvQ2ZtdGRCYUJvOVNoa1ZzNGg4?=
 =?utf-8?B?YzdmeGYxZU1YVnlxYUZWYWxvS1pUeVorUTdUWTViQlpndURXRjlZck5kd01V?=
 =?utf-8?B?ZTE4V2w4ZktnS25mQ0lkWVNIbUR4dGtNbTZ0VEtQTThKa3ZPcTJwaEoyOVhR?=
 =?utf-8?B?N1U0WU1xekNmNnJKMzU4dzRzZVNRN05hcWR4azVhZjhKdVVHTWppOEwwQytM?=
 =?utf-8?B?SmVnU010NE40TDVYS0p6T1FqUHZWSjg1WG1kelBLVmhjbTVaTDREZWs4VWdK?=
 =?utf-8?B?QVBNcHp2Y3lNQkFwUVh5K29USVF1ZmJTSFE2NzNmbUF2ZXJZSDZDVW9tK1Ez?=
 =?utf-8?B?VHJUWVY1Vkd4S0NvZ2JiTDZ5Q3d6b2V2b3BjZUd1dkhsWm01M0FzTGNkMElh?=
 =?utf-8?B?aVk0dWFLWW04RXdtNkhlZS9VVUc4ejFpR2J1RDFrMU0vclFNNGxBRytYS0lx?=
 =?utf-8?B?a25EalpyZ3JWVnVsWVN2cXBsc1dPdWhYazYxODlTMElGRlNKa2FLVVZVSlJM?=
 =?utf-8?B?ckxHcTVtdCtCUXMyaDVIY1YrS3pkcFhDVnVPRDVqeTduMlBGUDVmVjBLeFMy?=
 =?utf-8?B?aHFqRE1HV2syZGF4cFBnRVdOQjQwUFlmT21KYkJqK2RrTUJyYzY0ZHowb1hw?=
 =?utf-8?B?TEdQUFo5VElyMFBQV3U5RzVnMUxETnJJQzlXeFBvRGVDUmxsVmRUQ2xRcFJq?=
 =?utf-8?B?Zll3cmZZb29md1hteGI4ZEN2NDBUN2Q0YmR5R2JtWkpqU3dnc1JPNmw2WmNs?=
 =?utf-8?B?aXd4N1N5WkF6dnNIUUZVL2ZYVXJyYktwWklBMXZaY3NRTFI1WFBYTmhOZzZN?=
 =?utf-8?B?UTFJSlNYTVJ6YnNzRVNpeWhZMDI4N2tUS2J4Y1ZLSzNZME9LcWN4dnNiS3hq?=
 =?utf-8?B?TmhONDVueXczc0FMNXdlK1ZOU21pOTNCUDV6TTAwRVV3dHBTVU93L2NkTGQ2?=
 =?utf-8?B?M2ZjVEZHRVc4d28rL1FpMmNSUGw0bmd5dmFHTE9VcVVKTVpENVlpbjNtYVBV?=
 =?utf-8?B?QnE1YWtaS0hQS2tjZFk2a05UdjYzS0pCcU4vK051SlhBUFJWLytHcm1HZmZO?=
 =?utf-8?B?UDUvU3VmbXlPdW5NUlJTdWt3cWw4RTdJbW0yZEwyejZxVDBvSVhUQTZyQXNX?=
 =?utf-8?B?aWhRemNRaC9wQkZJVVZKZ05ia0R2cTFlWDRvQm5QL3NGRmcwYzZETExsY1R6?=
 =?utf-8?B?Wnpsa0Y0NExuL0NWWFpZZUM1aE1kd0JMbGhJdnhxakY4cjdZRDZDMGxKNjBG?=
 =?utf-8?B?UExJV2NTcXB2NUpCRCt1dC9maWFsQStHSS9xek1XVFdLeG4yNmdUVzlVekxD?=
 =?utf-8?B?YTVpTXNDdEJQdUxQR1R2VkYwKzZoTlpYaWN4eXA2S1AwOWxxY3FiSHhlb21u?=
 =?utf-8?B?L05IZmNDNkZqRmErelZoNmlRSitwSkdpOWljcTl6Y1ora1UrTVZ5TjdlUkV1?=
 =?utf-8?B?S09wdmsyRGlMQVUyb1lGVEE1RS9MSFZnN2g5cEtIVkVvZUV3bFB0TC8ycTZx?=
 =?utf-8?B?SmpWVnZlMFpxTjRpelAzdHgwSnBlMUUxTlZwZlNOQ2htY2FvSzNlVVc1SGZ3?=
 =?utf-8?B?MTE2MTdiem1laXk2cGVxRG1BOXhTYSs4ZnNFVnVZU2FiWjFEK0lwcHg2S1lr?=
 =?utf-8?B?UHE4QnArVnlyMUN5TGphUWxNWWF0dHpDNHRxdTZNUVZDR3lOUldUVjNaL0lh?=
 =?utf-8?B?ZXZsbk9zUXptdkdMbmRuUStRalZ1cGRySFBpYjA0ek5Jc0FIdGlUSVd1TG9E?=
 =?utf-8?B?VElUdVFPeHVnRE9yRGJ1aHF6THVvcjVhVjBBZlBFYUxVRlY3c2RHWU1zOThP?=
 =?utf-8?B?OXlQaXErbEtaZTVjenJJMmRXMFdWQ01Ebm9hUjY3ZmVZR2hDRTFzVW43aUlR?=
 =?utf-8?B?Mm5NakRSNXBMTURvNFBaeEpVemsreC9jNlgralk1RTUxcXhQZnUyVmg5ei83?=
 =?utf-8?B?VUJGS0NORG5BUHd1US95U2xTM2xVc2hsbFRpQnR1eDNZQ210S015THl0d20y?=
 =?utf-8?B?N2k5eWpjSkNXbi9EdzFKbUNMVkdBRzUxbFM2dGkzNU44Y3A4eVdFSGZiVnZO?=
 =?utf-8?B?Z0o1anlWQXFKMzBzWk9HSU9RVEJzcnFkM1E2V2RLZ09xM2dpRU5iUkIxUU1G?=
 =?utf-8?B?NWhtcnJWSmc5QXRpQ1k0bDZxWklqVFRLNktCdnBqWWZ1aktVd2g3SlhiOVZk?=
 =?utf-8?B?ajVxQXVnMmlVanZVbVBlUHl5aklFNElJcWZDUWNHTFl3VTdQcFByQ0FZYnFw?=
 =?utf-8?B?dmIweDY4cW9kY0VTZXJPSThObFlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263643b6-76eb-42a7-3f05-08d9a2d58cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 16:33:51.9968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebYttgQKy5J7bmInSPHV9JSLuzmulxx9EE851fmbs+ZHhzWmnR45a1CWeV59yRhID/7IYiNd7QL80f/L1gYINmsrw0xY4imF3GaTpu5yeUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5048
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UkZDIDIvNF0gZHQtYmluZGluZ3M6IHdhdGNoZG9nOiByZW5lc2FzLHdkdDogQWRkIHN1cHBvcnQg
Zm9yDQo+IFJaL0cyTA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgTm92IDQsIDIwMjEg
YXQgNTowOSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3Rl
Og0KPiA+IERlc2NyaWJlIHRoZSBXRFQgaGFyZHdhcmUgaW4gdGhlIFJaL0cyTCBzZXJpZXMuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9yZW5lc2FzLHdkdC55YW1sDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMs
d2R0LnlhbWwNCj4gDQo+ID4gQEAgLTc1LDE3ICs3OSw0OSBAQCByZXF1aXJlZDoNCj4gPiAgICAt
IHJlZw0KPiA+ICAgIC0gY2xvY2tzDQo+ID4NCj4gPiAtaWY6DQo+ID4gLSAgbm90Og0KPiA+IC0g
ICAgcHJvcGVydGllczoNCj4gPiAtICAgICAgY29tcGF0aWJsZToNCj4gPiAtICAgICAgICBjb250
YWluczoNCj4gPiAtICAgICAgICAgIGVudW06DQo+ID4gLSAgICAgICAgICAgIC0gcmVuZXNhcyxy
emEtd2R0DQo+ID4gLXRoZW46DQo+ID4gLSAgcmVxdWlyZWQ6DQo+ID4gLSAgICAtIHBvd2VyLWRv
bWFpbnMNCj4gPiAtICAgIC0gcmVzZXRzDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogIndh
dGNoZG9nLnlhbWwjIg0KPiA+ICsNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBub3Q6DQo+ID4g
KyAgICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAg
ICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICAgIGVudW06DQo+ID4gKyAgICAg
ICAgICAgICAgICAtIHJlbmVzYXMscnphLXdkdA0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAg
cmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBwb3dlci1kb21haW5zDQo+ID4gKyAgICAgICAgLSBy
ZXNldHMNCj4gPiArDQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiAr
ICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAg
ICAgICAgIGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHJ6ZzJsLXdkdA0KPiA+
ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBpbnRlcnJ1
cHRzOg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArICAgICAgICBpbnRlcnJ1cHQt
bmFtZXM6DQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgICAgLSBjb25zdDog
d2R0DQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBlcnJvdXQNCj4gPiArICAgICAgICBjbG9j
a3M6DQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlv
bjogTWFpbiBjbG9jaw0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBSZWdpc3RlciBh
Y2Nlc3MgY2xvY2sNCj4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBvc2NjbGsNCj4gPiArICAgICAgICAgICAg
LSBjb25zdDogcGNsaw0KPiANCj4gVXN1YWxseSB3ZSBwdXQgdGhlIGludGVybmFsIG1vZHVsZSBj
bG9jayBmaXJzdC4NCk9LLiBXaWxsIHB1dCBpbnRlcm5hbCBtb2R1bGUgY2xvY2sgZmlyc3QuDQo+
IA0KPiBQbGVhc2UgYWRkIChhdCBsZWFzdCB0aGUgZmlyc3Qgb25lKToNCj4gDQo+ICAgICAgcmVx
dWlyZWQ6DQo+ICAgICAgICAtIGNsb2NrLW5hbWVzDQo+ICAgICAgICAtIGludGVycnVwdC1uYW1l
cw0KDQpPaywgd2lsbCBhZGQgdGhlIHNhbWUuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4g
KyAgICBlbHNlOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGludGVycnVw
dHM6DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogMQ0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4g
PiArICAgICAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
