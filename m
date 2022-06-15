Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D2254CB64
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jun 2022 16:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239172AbiFOOcG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jun 2022 10:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbiFOOcF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jun 2022 10:32:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214DB49B64;
        Wed, 15 Jun 2022 07:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf5gAFgIRuDNzS7r0w1phnh/IvQoWF+qB9kAK/3D6S4M/2lNqy8mVqmfqX6F/2/oq12zjsEWNUmuBmeCMkyFscuqAAtmwD/47bL9EgxJ9S+Flq0xq6RuLBCAwVlFrHylgOQbRcEZtoURp7013UottgOb4PSF69bbx0QMfPqd7GN/3Mkf9zQzQajxgbLQkdP5srrzhaOQZ+AYkxpL5KNRbcHJJ0SMy53yW6PW2XgZ0kpuDHIb36zKmZwkhK/Ru94XABIK9ztRUX6ZcM7r+tU0qo0bgj9H1vamg7fIV7J2zK9z4/Z6rsuUS7kUGA4pIFEzDxuwqKv59aYIoelxDDSFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/sjor6G8GgaKrXLDTZ2KEYFFfgTjd9TZI3bJfWqVLA=;
 b=IJCNaUicr3VkxgT/Olob1B6Qd50Eb2QHQf1+VOyfTvNDqe9DyQDvTh6tuwLSoR8mdR5zdqPB7+zjw4pEF7l5eB3pDIZw7obpUadP+zJ9L28hdR260D0okfY+IrgAQcgm9RXRTdytPiLCytzZHKQKY/vFSAmig/QDL/MjSk0kyvRIxRbgYnCtmIfOUNkQIymVmvlD+xXULreb/NPiz33a3DNpR5qbmlUV1rnxwkYTFTMBTtsAwibLFOdtsd96fQbEbM9nfBuVfvjG+UdxutvEQB+3wkHaphc6ZYVwyRIprliBRXHI48Pgi5KhFw1qGPME8kX0/TJnkpq78VuTFWvINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/sjor6G8GgaKrXLDTZ2KEYFFfgTjd9TZI3bJfWqVLA=;
 b=LBaXnqk5+vEDPFwgAYjYy9o0iEkQS9c9VhGFPNqJ7C9gdlEugjx9jfTGufSR3D4Jq7yVYa5rW0DsJOZNviLjPnh38OU7YNeuPbyk1ans2VSMvkwK+CQBy2W5JQf80HOZcLYRpxwTETjIJW9o6CGAcSGlIZUnf+2qwkFYppMxO24=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB5640.jpnprd01.prod.outlook.com (2603:1096:604:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 14:32:01 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 14:32:00 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Topic: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Index: AQHYfzckiD7LTixQXUa9ezjzZMuhQ61QOY4AgAALjXA=
Date:   Wed, 15 Jun 2022 14:32:00 +0000
Message-ID: <TYYPR01MB7086A4D1B42A213937EB6229F5AD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220613150550.70334-1-phil.edworthy@renesas.com>
 <20220613150550.70334-3-phil.edworthy@renesas.com>
 <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
In-Reply-To: <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83138f1b-1670-4671-ff27-08da4edbcf48
x-ms-traffictypediagnostic: OS3PR01MB5640:EE_
x-microsoft-antispam-prvs: <OS3PR01MB5640C9A9DFB2C9DCE256290BF5AD9@OS3PR01MB5640.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNtPJ0Qs91irtOOFhO51tD72NzELDl1CqcH5dc1q2XyhBnPSbrysgdRaerdvuBv4qOk74/huGbseWoeqhsOXoVerW116nE38KtXWu1I3zrvhzLDKUZ3z/dk+De29pYamLQs5BIZgd7fG4nQW5Q6Eo+JSPIrYDbr5qLlRVfrYpA+8GxSIkaOJC/xiuee2+YF+/nV//5w3tNwWEweRKvxUN77ChkNipxm3jPOdDO3IGH5/6xsCeSiA3vn+bjnSOsbND2l+mDBorXP05HSVIX9OyzM9MeYTwlhCi/5alrHD3FrrSIJeo7aM5CWX1jBEhGezw/Tm1KhHwxlTIWYypkLnQ8wAXRs24LPaKjCVVzBS1zV7IPY67mT7K+zB2BWLk0n1IP4yi13TKkgY/hDaBADdFr4H7Pg/o5LXStTkVYwxSVp2lVMdY3bQl0nSNxwA/yU2pfkS2BbxZw6UHusTWWinq8UO7ndNxVnIGSeomZhr4kTTkutoIDq12XtgK/ZqWklulKePLQgalpMygvMCm+DaMe7jBKU5ff47gr1B8IusfBqvpE53XpLRWLjsoJk2FELiOAXWhbuLkicodNcnYsk5M9e/ONlC5J1Mhmv3ZreOMTzpy2qYavXOvyHqLNEcCW0tgmwANB8rkc7CHgV5mJYX9W0+9u5JdenDOh+f8HNZ++8MhaNiM6pV3dS5WvIi5S0J797h5z3YtE88PkCUe5awLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(71200400001)(8676002)(38070700005)(55016003)(2906002)(38100700002)(316002)(44832011)(122000001)(508600001)(6916009)(53546011)(26005)(6506007)(7696005)(76116006)(83380400001)(33656002)(9686003)(4326008)(8936002)(5660300002)(52536014)(54906003)(66556008)(86362001)(66476007)(66446008)(55236004)(186003)(66946007)(64756008)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmJBUjJSMXpEdkFXL2xlbEtqK1BXeE5MbTFFZHp1cjRmQytFcVhTWGNPbHdu?=
 =?utf-8?B?RzZvc3BtS1BnSTJwb3dmZW1uN0M0T25VUFhUU2NrWUFrNzJudXZyZzNUSmVJ?=
 =?utf-8?B?L3JpbUhCNWpMdkl1M052S0c2Tmx2bHE0Qnk5YUVzeEhsdFB0YmNQcTdQNDB0?=
 =?utf-8?B?SjFQMzUxRG1GSDlzWXA1dmo3VlJLc3BDMFdDSm1wSHI0L2UxOUdWTE90UU42?=
 =?utf-8?B?c3NrYzd2OEFvN004NHRyOXRWcTU2V2c5M0tIRmxXbmZyYVBHaTFYd3J3OXNZ?=
 =?utf-8?B?WS84Z2ozTVpvbUlkSW5aTTZJMGpicHdmKzN3bmRaU04wNTIxV0NqLytYZC9k?=
 =?utf-8?B?UG1UZVRJNStaTnY5M0pEb0JWOXd4Slovb1U1WUxYRkdBY29KZEpMcFdaYkxO?=
 =?utf-8?B?dXJvenRWQ2hSQVZ0eXBGbFZLcU5RWDQ4YXhaQmIwWHZtYWNRTi90bEVVR2cw?=
 =?utf-8?B?d25UTVNkblVlaVlWakdnUTltcG5TUWNlQmRUN2xnNVMwTGQzV3lMZzk1cGd0?=
 =?utf-8?B?aUw4V2hsTlMrWGRLK0xFY0JndGZhVUkzbk9TM2NVYzVmVWxTbXQ2R1k4Q2ZG?=
 =?utf-8?B?Mk9abTBhOG1UMTVBbXVWL2xDLzRaRGova2dyeHNNeHhSYjlxNVdxa2dGZ2pG?=
 =?utf-8?B?bzlFcjBsTTAzc3F2MjVIbys2bFkvaGxraWpDUkNUMzJJa2JZWERZdytNMU5v?=
 =?utf-8?B?UGFWdjl0SHpzWjlCZHNMWHBLajRRV2VQbUkxV0NyNG5HeGxJUDNWZjFNNHBJ?=
 =?utf-8?B?a0R2NzR2S085dzlSeXZFUi9heFVCTUczMHNvMEdETm1xKzFtaERhcFhtSGU2?=
 =?utf-8?B?N3BaS29GbDZZcnJEYVdoUmw5dFZuU2JkMFpmQnpuSFBKdkVBQWhvcUxKU0xV?=
 =?utf-8?B?c3JOQk1PR3B6NTluS2NyZTk0cmdmdkVETlFXakFNWEt2MTZYWFRnYUhHZFZq?=
 =?utf-8?B?eTM2aktMZm01Vkh1SVdnVEdYVXREaE5Xbmg5cElOOTdoaWk0b2N3NE1raEl3?=
 =?utf-8?B?YWd3Ky9DcDkybHhkd3VGczVTNW5jNFo0d1puYTg0M01qVXlZeHJjYUZCNmc3?=
 =?utf-8?B?ZFhwZHBvNkZkY3M1dmVKOFJDWTAzWTV5VUdNR1NGeFNxOC9QM0ZDYUxoSFlI?=
 =?utf-8?B?OGF5Uzh5UExvemRrT2o3U1ZPVHV6dk5pQXhYd3BuTUpwL1FLWldWUzllM3Ju?=
 =?utf-8?B?eUhMc3JzWHRBOU5HRXB1emlKbmpTSFlPWHpidXpWZHNwVTlWSVhlYW55U2Nt?=
 =?utf-8?B?T3ZHN3dkVW4vMU9xenRydTJNYXA1NGozbm85U0VTUFU5RTd5ZDE2SWJZdkhX?=
 =?utf-8?B?S3REZ2RHWEYvKzFQMTdtVitUT0c1UEw1OVBrWDFMUFI2Q25wWllzdHA0eE93?=
 =?utf-8?B?SXBPV2dKOHVNNG8rM1VOUW82OEVuZ0pKLzlHaHR3anhLNWkvaEpGNmxaQ3hk?=
 =?utf-8?B?bjZSZGtLSmhOY2NrSDI0ZTgxUHVVWUR1VFowdHBraVRZMkdEdGpPQUNxYUJK?=
 =?utf-8?B?YkdFbjc0N25scldqeCsrWG9YWmNneUwwZ3cvTk1SSUk0dDV2dHJRK0JUL3hW?=
 =?utf-8?B?VVVzS2gxNlI3TTBhSkloMUVzMlBYQWNlaUtQSi9wa2J4WjlSL25OS2sweHhk?=
 =?utf-8?B?cnhLUWtvZE0zYzhhSlhlMCszRE1tcG9ZNUVnbkwydlV1ZkxuaU9SUzIwTXFP?=
 =?utf-8?B?dDd3cnJDUFo1NDAwU1YxRnN1TVZTazMyL0RBdkcwVVpzMzZGSVpkK3ltYXU1?=
 =?utf-8?B?MTY5Z0tKOXVFR0JmeEZuQXNUZFEvYjE4cEI3M2MyVGtFYnNxYjVUL2hJTmlx?=
 =?utf-8?B?dCtNME51SmtqWlVNZTZjNU5LTnVzcTBFamNKZ25WM3pkRGxUalo2citVZ1JZ?=
 =?utf-8?B?Umxpd0xRZXBtNmVFeXc0d2NNU3ZmdzFHSjcrRVc5T0lVRnZjbzY3MVRab05I?=
 =?utf-8?B?YUtjWVJXdURUVnFhOWVNMEdXVHN5a05zZ3VJcXZWVTZERW1qbWRCbDd6RDdQ?=
 =?utf-8?B?T3pUTlZydzZNN01ueDNEZDBVZitPVHkrMExiR1dsMDloTG8weHF0TlArVndT?=
 =?utf-8?B?T1JOQUdCblQ4alY5UTE3eXluOE0rQUlkbkFNbmlXazNyTm5BT0N6SmlmS3JX?=
 =?utf-8?B?WGlzcTVYVWE2TkpJZ2xyenlFdmN0SlVLOGwvYjF3dkZPOEVtYzU0R1FyUnoy?=
 =?utf-8?B?U0liR01YV0w3bDd1K3dCQUs4MThIZE5WN0laWi9aQmF2OGJ1WVc3S2QzZXVm?=
 =?utf-8?B?dXhlWWlpWEtnaVVvSTNkVGF1K1ZGWjlGT2RReEdBK2ZXR0RIZi9PaXk0Rkk2?=
 =?utf-8?B?QXg3NjdybG93UXVYVTRNZVE4YW1xcmhFWlJuUEhSRFcra2x1OVVaREIwQUVF?=
 =?utf-8?Q?sJbWqwapxpBqaMeg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83138f1b-1670-4671-ff27-08da4edbcf48
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 14:32:00.8506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re5oLKIwsX+y1+DBv7a4JHG8aC87RkqbgAeI7ECTmt+YqLhSEsc2iecoytRNKpxEK09X8Dp67rgmhbzCgUZe2EGmoo34QM4KX7uDa0iTNBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5640
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDE1IEp1bmUgMjAyMiAxMDo0MSBQaGlsIEVkd29ydGh5IHdyb3RlOg0K
PiBPbiBNb24sIEp1biAxMywgMjAyMiBhdCA1OjA2IFBNIFBoaWwgRWR3b3J0aHkgd3JvdGU6DQo+
ID4gVGhlIFdEVCBvbiBSWi9WMk0gZGV2aWNlcyBpcyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgUlov
RzJMLCBidXQgd2l0aG91dA0KPiA+IHRoZSBwYXJpdHkgZXJyb3IgcmVnaXN0ZXJzLiBUaGlzIG1l
YW5zIHRoZSBkcml2ZXIgaGFzIHRvIHJlc2V0IHRoZQ0KPiA+IGhhcmR3YXJlIHBsdXMgc2V0IHRo
ZSBtaW5pbXVtIHRpbWVvdXQgaW4gb3JkZXIgdG8gZG8gYSByZXN0YXJ0IGFuZCBoYXMNCj4gPiBh
IHNpbmdsZSBpbnRlcnJ1cHQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5
IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjI6DQo+ID4gIC0gUmVw
bGFjZSB1c2Ugb2YgcGFyaXR5IGVycm9yIHJlZ2lzdGVycyBpbiByZXN0YXJ0DQo+ID4gIC0gQ29t
bWl0IG1zZyBtb2RpZmllZCB0byByZWZsZWN0IGRpZmZlcmVudCBjb250ZW50cw0KPiANCj4gVGhh
bmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJs
X3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiANCj4gPiBA
QCAtMTM5LDE0ICsxNDYsMjUgQEAgc3RhdGljIGludCByemcybF93ZHRfcmVzdGFydChzdHJ1Y3QN
Cj4gd2F0Y2hkb2dfZGV2aWNlICp3ZGV2LA0KPiA+ICB7DQo+ID4gICAgICAgICBzdHJ1Y3Qgcnpn
Mmxfd2R0X3ByaXYgKnByaXYgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPg0KPiA+
IC0gICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPnBjbGspOw0KPiA+IC0gICAgICAgY2xr
X3ByZXBhcmVfZW5hYmxlKHByaXYtPm9zY19jbGspOw0KPiA+ICsgICAgICAgaWYgKHByaXYtPmRl
dnR5cGUgPT0gSTJDX1JaRzJMKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGNsa19wcmVwYXJlX2Vu
YWJsZShwcml2LT5wY2xrKTsNCj4gPiArICAgICAgICAgICAgICAgY2xrX3ByZXBhcmVfZW5hYmxl
KHByaXYtPm9zY19jbGspOw0KPiA+DQo+ID4gLSAgICAgICAvKiBHZW5lcmF0ZSBSZXNldCAoV0RU
UlNUQikgU2lnbmFsIG9uIHBhcml0eSBlcnJvciAqLw0KPiA+IC0gICAgICAgcnpnMmxfd2R0X3dy
aXRlKHByaXYsIDAsIFBFQ1IpOw0KPiA+ICsgICAgICAgICAgICAgICAvKiBHZW5lcmF0ZSBSZXNl
dCAoV0RUUlNUQikgU2lnbmFsIG9uIHBhcml0eSBlcnJvciAqLw0KPiA+ICsgICAgICAgICAgICAg
ICByemcybF93ZHRfd3JpdGUocHJpdiwgMCwgUEVDUik7DQo+ID4NCj4gPiAtICAgICAgIC8qIEZv
cmNlIHBhcml0eSBlcnJvciAqLw0KPiA+IC0gICAgICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIFBF
RU5fRk9SQ0UsIFBFRU4pOw0KPiA+ICsgICAgICAgICAgICAgICAvKiBGb3JjZSBwYXJpdHkgZXJy
b3IgKi8NCj4gPiArICAgICAgICAgICAgICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIFBFRU5fRk9S
Q0UsIFBFRU4pOw0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgLyog
UlovVjJNIGRvZXNuJ3QgaGF2ZSBwYXJpdHkgZXJyb3IgcmVnaXN0ZXJzICovDQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgICB3ZGV2LT50aW1lb3V0ID0gMDsNCj4gPiArICAgICAgICAgICAgICAg
cnpnMmxfd2R0X3N0YXJ0KHdkZXYpOw0KPiANCj4gVGhpcyB3aWxsIGNhbGwgcG1fcnVudGltZV9n
ZXRfc3luYygpLCB3aGljaCBpcyBub3QgYWxsb3dlZCBpbiB0aGlzDQo+IGNvbnRleHQsIGNmci4g
Y29tbWl0IGU0Y2Y4OTU5NmMxZjFlMzMgKCJ3YXRjaGRvZzogcnpnMmxfd2R0OiBGaXgNCj4gJ0JV
RzogSW52YWxpZCB3YWl0IGNvbnRleHQnIikuDQpPaywgSSBzZWUuIEkgaGF2ZW4ndCBiZWVuIGFi
bGUgdG8gdHJpZ2dlciB0aGF0IGJ1ZyBvbiByei92Mm0uIEknbQ0KTm90IHN1cmUgd2hhdCBJIGNh
bid0IHRyaWdnZXIgaXQgdGhvdWdoLg0KDQo+IFdoaWxlIHlvdSBjYW4gY2FsbCBjbGtfcHJlcGFy
ZV9lbmFibGUoKSBpbnN0ZWFkLCB0aGF0IGNhbiBvbmx5IGJlDQo+IHVzZWQgYXMgYSB0ZW1wb3Jh
cnkgd29ya2Fyb3VuZCwgdW50aWwgeW91IGhhdmUgaW1wbGVtZW50ZWQgUlovVjJNDQo+IHBvd2Vy
IGRvbWFpbiBzdXBwb3J0Li4uDQpTb3JyeSwgbXkga25vd2xlZGdlIG9mIHBvd2VyIGRvbWFpbiBp
cyBzb21ld2hhdCBsYWNraW5nLi4uDQoNCkkgZm9sbG93ZWQgdGhlIGNvZGUgaW50byBycG1fcmVz
dW1lKCkgYW5kIHNlZSBmcm9tIHRoYXQgY29tbWl0IG1zZw0KdGhhdCB0aGUgcHJvYmxlbSBhcmlz
ZXMgaW4gcnBtX2NhbGxiYWNrKCkuDQpMb29raW5nIGF0IHRoZSBjb2RlIGlzIGFwcGVhcnMgdGhh
dCBpZiBwb3dlciBkb21haW4gZG9lc27igJl0IHNldCBhbnkNCmNhbGxiYWNrcyBpdCdzIGNvbnNp
ZGVyZWQgYSBzdWNjZXNzIGFuZCBzbyB3b27igJl0IGNhbGwgcnBtX2NhbGxiYWNrKCkuDQoNCklz
IHRoYXQgd2h5IHBvd2VyIGRvbWFpbiBzdXBwb3J0IHdpbGwgYWxsb3cgdGhlIGRyaXZlciB0byBj
YWxsDQpwbV9ydW50aW1lX2dldF9zeW5jKCkgd2l0aG91dCBpc3N1ZT8NCg0KDQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgICAvKiBXYWl0IDIgY29uc2VjdXRpdmUgb3ZlcmZsb3cgY3ljbGVzIGZv
ciByZXNldCAqLw0KPiA+ICsgICAgICAgICAgICAgICB1ZGVsYXkoRElWNjRfVTY0X1JPVU5EX1VQ
KDIgKiAweEZGRkZGICogMTAwMDAwMFVMTCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwcml2LT5vc2NfY2xrX3JhdGUpKTsNCj4gDQo+IERJVjY0X1U2NF9S
T1VORF9VUCgpIGRvZXMgYSA2NC1ieS02NCBkaXZpc2lvbiwgd2hpbGUgcHJpdi0+b3NjX2Nsa19y
YXRlDQo+IGlzICJ1bnNpZ25lZCBsb25nIiAoeWVzLCB0aGF0IGlzIDY0LWJpdCBvbiBSWi9HMkwg
YW5kIFJaL1YyTSA7LSkNCj4gVW5mb3J0dW5hdGVseSB0aGVyZSBpcyBubyByb3VuZGluZyB2ZXJz
aW9uIG9mIGRpdjY0X3VsKCkgeWV0Lg0KPiANCj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gbmVlZCB0
byB1c2UgYSA2NC1iaXQgZGl2aWRlbmQsIGFzIHRoZSByZXN1bHRpbmcNCj4gZGVsYXkgd2lsbCBi
ZSBtdWx0aXBsZSBtcyBhbnl3YXksIHNvIHlvdSBjYW4ganVzdCB1c2UgbWRlbGF5KCkgaW5zdGVh
ZDoNCj4gDQo+ICAgICBtZGVsYXkoRElWX1JPVU5EVVAoMiAqIDB4RkZGRkYgKiAxMDAwLCBwcml2
LT5vc2NfY2xrX3JhdGUpKTsNCldpbGwgZml4LCB0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLg0K
DQpUaGFua3MNClBoaWwNCg==
