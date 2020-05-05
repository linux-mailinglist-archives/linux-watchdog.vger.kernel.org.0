Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55AF1C6036
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 20:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgEESjH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 14:39:07 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:2709
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728180AbgEESjH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 14:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndXE2AE2iIVueuOQ4VlDDtR61ie3UcKpkCPSE9W7rRerlYvhX7hjn12GqX3VYk9/UE93TiBdHyDrMANFfVB3whFelpP6Vfdwoxa7ISb8F3ZnWz33dvsdxAJeXRJXKl0PTiTYe67bseR3kUOstHECChF5ftUtsy5fkFGf+f0z/wTY7P73UqocT3tNu3wl1n8za4swnQoGwAWPyrhOgFeMYuFNNJbuM38achbi9okdAONbGteor11eO6Wgo7l3FmRefNIB5/cUWR8A6Qss3TwcjKX2L1erzdTifE0pvDw2Luy5EpJeKmjYI5qM5A4CKCxlRMgirVGDsuBFmzmRgA23mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+T42QDikJXsNErNw4Q3Etl0bdtr6MCJodpJuFrST6Y=;
 b=CvU4CR9r9PncyI7NuObLAg33WIf8oTGM5E9jroVplqN+PXwGAILbHDa6dV3Zi21UdoEtfQ8fC2xm1hAZzaie2ncuTbEmQ5so9T3O78QEt3Kgrc9mGL0N0hS79yAC5Y19FW6IYZ7NeZfV4FkX9Zew1+73chtAJHSQFz49c6xSHlxYFPDYOyk+RCeCUrYxAQwifLc5xFqAqxBCJ4LXcHL5MNSzavM2f5Gq9wMYx6udgmCwkB52Hc5W9ZAh1k6ACZsv8hME8M+BgvkYugcwjdTa2885JJ1AUBh2rS5JZFlQeQFLDobb2WX12UQ4XQgoSe1UaUzOxSTsNjHRsssTyrPbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+T42QDikJXsNErNw4Q3Etl0bdtr6MCJodpJuFrST6Y=;
 b=rFEMB8RNfm8VGOYmunsKT2vTzqnpjrAq0xqzLEn/a/Xe4NvBpyEQrO8S8UJGVf31nrIVL7ut6zFRccbd+THB2cYT+gCicLcv2AD18D6vUkpRcOhYkCHNGtknIvLCz8UkY81cxHp4G6DWqLc04ZhsGhqnf3N4BFTTWE2XMG3OxLw=
Received: from AM6PR05MB5064.eurprd05.prod.outlook.com (2603:10a6:20b:11::18)
 by AM6PR05MB5302.eurprd05.prod.outlook.com (2603:10a6:20b:69::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Tue, 5 May
 2020 18:39:03 +0000
Received: from AM6PR05MB5064.eurprd05.prod.outlook.com
 ([fe80::486e:3977:fe72:5777]) by AM6PR05MB5064.eurprd05.prod.outlook.com
 ([fe80::486e:3977:fe72:5777%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 18:39:03 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Michael Shych <michaelsh@mellanox.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v4 0/4] support watchdog with longer timeout period
Thread-Topic: [PATCH v4 0/4] support watchdog with longer timeout period
Thread-Index: AQHWIh5tBODM2XuUYEGsEq8NYnQEZqiZqsCAgAABdICAACe3QA==
Date:   Tue, 5 May 2020 18:39:03 +0000
Message-ID: <AM6PR05MB50649F646F8A7870160D1973A2A70@AM6PR05MB5064.eurprd05.prod.outlook.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
 <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
In-Reply-To: <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [46.116.55.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9fdc4d8e-3677-415c-657a-08d7f12395e8
x-ms-traffictypediagnostic: AM6PR05MB5302:|AM6PR05MB5302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB53029D21FF34D995B5BCEA4EA2A70@AM6PR05MB5302.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3qq+ZayFzwZM/wMs/IMk9e11Of5A8MqKxG1N8UzHC8HPzh0rDvG0NG4EM8gcf3oRYW6y9nr/lcGW+US6PZ309QXCwquuEar/YTydi1toG/igKOdo6DmpDkN871ktZcfgk71JUUetOQkIqSufj+MENgOROMibV+LW7W78oE81evA9CM+UamXJJuANSXsPQMxjnAWpAL04t4Mly+hi3LH9Us2G6359+Lu4SdmnTUaor48yS1O/KJzlB+q2j5Sn5U5EI2q7WglHw+m2MzE6XDrbl5cz6OhpQ007ZUKw3iswKxfBX6s1GMhM7S7BGI1N9rGWvQeYiywq79tanqwvq4EnZr6RG1tjSWs669fuiWblLlD309oBAS23bTmcsF5JDVZ47rg/J+tpR0eTtltvyWoai4tLzKF36kwmH9Hs7elwyGt+2cnLGyxt68rqf7GPFB7mIaTa8gXbqQx6L8jHwidFsgDlLecqWNd+g2HeYLLOjv/TSRsaX2CY//fAUDDKFYJP1P/CPAYJcRUJ5BLFq2aCwpyUQWLlqcWwnh/81WB4zoXaA6Oe5Qu+p63sLhb3Q2Y/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5064.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(33430700001)(8676002)(6506007)(9686003)(478600001)(33656002)(4326008)(55016002)(2906002)(186003)(66946007)(76116006)(71200400001)(110136005)(86362001)(26005)(52536014)(54906003)(8936002)(53546011)(316002)(64756008)(33440700001)(66446008)(66556008)(5660300002)(66476007)(7696005)(148743002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cc4BAU1R97veMrTi68J24+++UVcB0MwCvx0H59f80zjW6Fg3vN005RTW6LhI3gDTkZFAiWqmTX7mb7TYrcGYnowvr9WD1SGGKX7G2RN/UO9qc/zmzZQBnia95k6VI1F2M95ct1YvvIU9nj9S8gNOQq13m2T2nmKTcGXJpuCh5kfYotS+IfcT3C4rbhH1Qq39xD5QvY5Y7gEvjS1K1EZdi9Hbev3MMr8rlGEkii+CkPK8sgeGEoju0wL5749dk7fXgdzeB9jDy+ZUuLkvMqmm2QHJ66xatYWPDPfSGU/LR3MYXJgCqNecPrzzc0XYNopJCvU7O9tXaChjWiwgWTj5f69hgnbvgaucml74M62FHTwm0U4x4Xjgazo+nTtGyjLaAno8k5d+hkKvn5Kij8I1kwsgnGAe5HCaLqnEGRm68LIaZDOI0t84ikd3KDVzZFHCerKRUSZiejRF1Vle+F3C6x6PgZmdN6SKKiN/vLK4eCwmZEwlhkvKoNkFNwcc4TEFGHLp2spcJ67J0yiJhhMCEtItdYteUt0FWoIWaLA/cAyayGN+XmzDh/K0CbpfZgm/T+nCVP7NaKINdHZsnpR44UeQeFt4MMq0xbcmkbZkBPuPW81NLQ7NWiJETvT40TM2ZvS6MMAejUfgHO/L/18wmn7qtsHMfF3Yy2MPPKH/uUVdfCwljeKszc0eFdwN7oc8GZaVu67wL3jAGU7/8dRQxA3yla60RGUP2OHICaDl42rxP4HMUDqeIVzVN8QSZFFHDIVxMqpExQm32UMNpUvjbojf7VD1gmuiSXS+7Hmo2ZA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdc4d8e-3677-415c-657a-08d7f12395e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 18:39:03.6130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmqTAeUT9mmS/gMLaETw30+yCfdOn+atyfLNPp9APz8+x/vSWPxEVpsSuc8cOEQmTHKa3MQvHXnUQ6Pq+fmJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5302
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMDUsIDIw
MjAgNzoxNCBQTQ0KPiBUbzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiBD
YzogTWljaGFlbCBTaHljaCA8bWljaGFlbHNoQG1lbGxhbm94LmNvbT47IFdpbSBWYW4gU2Vicm9l
Y2sNCj4gPHdpbUBsaW51eC13YXRjaGRvZy5vcmc+OyBBbmR5IFNoZXZjaGVua28gPGFuZHlAaW5m
cmFkZWFkLm9yZz47IERhcnJlbg0KPiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz47IGxpbnV4
LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgUGxhdGZvcm0gRHJpdmVyDQo+IDxwbGF0Zm9ybS1k
cml2ZXIteDg2QHZnZXIua2VybmVsLm9yZz47IFZhZGltIFBhc3Rlcm5haw0KPiA8dmFkaW1wQG1l
bGxhbm94LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwLzRdIHN1cHBvcnQgd2F0Y2hk
b2cgd2l0aCBsb25nZXIgdGltZW91dCBwZXJpb2QNCj4gDQo+IE9uIFR1ZSwgTWF5IDUsIDIwMjAg
YXQgNzowOSBQTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KPiA+
IE9uIDUvNC8yMCA3OjE0IEFNLCBtaWNoYWVsc2hAbWVsbGFub3guY29tIHdyb3RlOg0KPiA+ID4g
RnJvbTogTWljaGFlbCBTaHljaCA8bWljaGFlbHNoQG1lbGxhbm94LmNvbT4NCj4gDQo+ID4gPiBN
aWNoYWVsIFNoeWNoICg0KToNCj4gPiA+ICAgcGxhdGZvcm1fZGF0YS9tbHhyZWc6IHN1cHBvcnQg
bmV3IHdhdGNoZG9nIHR5cGUgd2l0aCBsb25nZXIgdGltZW91dA0KPiA+ID4gICAgIHBlcmlvZA0K
PiA+ID4gICBwbGF0Zm9ybS94ODY6IG1seC1wbGF0Zm9ybTogc3VwcG9ydCBuZXcgd2F0Y2hkb2cg
dHlwZSB3aXRoIGxvbmdlcg0KPiA+ID4gICAgIHRpbWVvdXQNCj4gPiA+ICAgd2F0Y2hkb2c6IG1s
eC13ZHQ6IHN1cHBvcnQgbmV3IHdhdGNoZG9nIHR5cGUgd2l0aCBsb25nZXIgdGltZW91dA0KPiA+
ID4gICAgIHBlcmlvZA0KPiA+ID4gICBkb2NzOiB3YXRjaGRvZzogbWx4LXdkdDogQWRkIGRlc2Ny
aXB0aW9uIG9mIG5ldyB3YXRjaGRvZyB0eXBlIDMNCj4gPiA+DQo+ID4gPiAgRG9jdW1lbnRhdGlv
bi93YXRjaGRvZy9tbHgtd2R0LnJzdCAgIHwgIDEwICsrKysNCj4gPiA+ICBkcml2ZXJzL3BsYXRm
b3JtL3g4Ni9tbHgtcGxhdGZvcm0uYyAgfCAxMDYNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gPiAgZHJpdmVycy93YXRjaGRvZy9tbHhfd2R0LmMgICAgICAgICAgIHwgIDcz
ICsrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1f
ZGF0YS9tbHhyZWcuaCB8ICAgNSArLQ0KPiANCj4gPiBHdWVzcyB0aGUgYmlnIHF1ZXN0aW9uIGlz
IG5vdyB3aGljaCBicmFuY2ggdG8gdXNlIHRvIHRha2UgdGhpcyBzZXJpZXMuDQo+ID4gVGhvdWdo
dHMsIGFueW9uZSA/DQo+IA0KPiBjb3VudCh3YXRjaGRvZykgPSA4DQo+IGNvdW50KHBsYXRmb3Jt
KSA9IDYNCj4gDQo+IFRob3VnaHRzPw0KDQpIaSBBbmR5LA0KDQpXZSBoYXZlIHNvbWUgbW9yZSBw
YXRjaGVzIHdlIGFyZSBnb2luZyB0byBzZW5kIGZvciBwbGF0Zm9ybQ0KZHJpdmVycy4NCk1heWJl
IGl0J3MgYmV0dGVyIHRvIHRha2UgaXQgdG8gcGxhdGZvcm0gYnJhbmNoIHRvIG1ha2UgZnVydGhl
cg0KbWVyZ2luZyBlYXNpZXI/DQoNClRoYW5rcywNClZhZGltLg0KPiANCj4gLS0NCj4gV2l0aCBC
ZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
