Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83E8388B3A
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 May 2021 11:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240632AbhESJ5h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 May 2021 05:57:37 -0400
Received: from mail-eopbgr150081.outbound.protection.outlook.com ([40.107.15.81]:55838
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239269AbhESJ5f (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 May 2021 05:57:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzSZBP4hbO+LKpNPE1I7XSmQ4WLvXi6CI7WMVt/llzFqq+fgWubpu5p6O/7UM8L3z+NvNtG9Lc3+QE56USHWEQuWceEoVg1jFPiUz+INI2DTP+CS5Azy9yEn6xtCKwtV4CtxUm2c5sc64B6VgWI9FY65R84yfGGCN4MKVEaFgTiwkh9I8r2gandFToB/Dwfx4DRBpffv6wPPFmDu8KRzQbFOgFe+dSCuW1Tjvf549roZmTfaaYlGzQQ1pNT1NO+ufxNay+pyKUOiGWlPAI0QpnpFmw+mMMYBySmoxPPG3OBgRegHl0MOxsSwWjLYOPRDOvP5HE3UsJ5WDmaSkbHy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIMWr/NaX7A+11gldlqKiIOJe/ilHuS7Qui/XEyA7RA=;
 b=ePH48ans/Ep4PpMmLoPPV5qO2fhirQU51SExSTSt5k7linjGwaNdh1itb+IXJXYtIbMkomqX8jZQ5Fhd09bKf1tTlTBHvj0KeiXaHSSDZYZ94yxFAVOeLiDIl+q8i/YzVk6Ibjh+dSYfS+3JVmbXJYIeFCqVmKw3DfT6rE7P8u80nWfNvJPYnFtSt6S4lq56E3gv7wL3KxnuoJyxq5mXCh+k/VjKvR7qEgljGlLDqpdx0gPK1A4oyIZX3ioifEXHfg592yMBsSAdIa1fosOIVeaMAUKXkkNM5LNuM5suTauZ3vIw8wsG+7wfAwL6qGas4C7RsK0WH1CVeYxaeO3aPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIMWr/NaX7A+11gldlqKiIOJe/ilHuS7Qui/XEyA7RA=;
 b=NlyIir+PaweeqwmjWUQpNkPH/4ELKv8ADcDCBjE0VGetvVQYEOckOy1BcCoOY1KwKdpMOXqvpb9EMboMlOME7OPV0yBJTsxD6A62FFfhTnb8qC4J2auV1Kgs+Cd4DUlprvKO9TMT7uyiWg4tV6Nmpc1kbAKU51wdpaH1+tEh6bw=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB7494.eurprd04.prod.outlook.com (2603:10a6:20b:23f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 09:56:14 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 09:56:13 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stefan Eichenberger <eichest@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: RE: [RESEND PATCH v2] watchdog: imx_sc_wdt: fix pretimeout
Thread-Topic: [RESEND PATCH v2] watchdog: imx_sc_wdt: fix pretimeout
Thread-Index: AQHXTIVr23tSDD/EsUGlads0X2xGQqrqkT1g
Date:   Wed, 19 May 2021 09:56:13 +0000
Message-ID: <AM6PR04MB4966594044F4F209E00846C7802B9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210519080311.142928-1-eichest@gmail.com>
In-Reply-To: <20210519080311.142928-1-eichest@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e90ea3-0b78-48ba-3a1f-08d91aac5683
x-ms-traffictypediagnostic: AS8PR04MB7494:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7494760E6FD7AE7AEAC8B9B6802B9@AS8PR04MB7494.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mccsNPew4p0l2xs829KYzjVO/+ExPontQ+FcBIV202r7d7Lo90Qqppg2CnFk1zeCOE6R20ek1ykMfyywRHTIdTa6XLgznb+fO4QiyVskm267+iXlZUgszwoLdW78YiZI2mFR7t85sjpmYqnmfxPQaip6M57bhO23UGpc7FvtljgeugSPFau0PiPAIe42a+zT0xybAMqPC3lKhsSg2XlLlwvgCc08de5zSNrqWhgA3e8q4ckXRfs7Vcrlcy66NlcFMj8dRMuzHCcOUb2lDdOQx45OP0x9qa3zn2wH6pUtg/ThuXgxJBMnGu7uM8KhpRoO5MYzSLf4RFXk5ctv/uMZlp6bxAbzRIYc7+yKBa2yvexSM9Y8YsKRIt9jxMYpYlsZRsuQvGfP81+YUEwAaSLQ+4fZHZ/k96DFB/uuT9wPDMXJ+/NcK5Ucfj+nDdCpemY9K9LdzHOU1HhJfbqMno67b7uq3O6f//4dGQ5Gk8bHDBVUcJPKIc+VzzKVB0r399TRp4J7xoLqLaGuTIATmVbTGrOGXlyXPzxFOlMkt4lvZv4mpjn/Pl+jnWmWwM/YMVA3w6QZEkYhOKXLL15I8r8DIzU8NvjX7vPAexoq92cy4ps=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(4326008)(2906002)(6506007)(7696005)(110136005)(71200400001)(44832011)(55016002)(8936002)(9686003)(54906003)(8676002)(316002)(64756008)(26005)(478600001)(66946007)(52536014)(186003)(122000001)(76116006)(38100700002)(66556008)(33656002)(5660300002)(66446008)(66476007)(4744005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OWg4bW95K1F4Z3lyQmNkRGM2QnZ1aGUwVzZBTkNNNGhGcXlPOG4rR0doTXZl?=
 =?utf-8?B?TE9mVlJCdXFPeWV5OEt6MzBHUEdRSjA1N0F5YzVwODlYUnV1b0tYSGpBSzZV?=
 =?utf-8?B?V21xYkJYZ1NvZEFycDlmcFduZWgwcXZpRml4enBRRzhvZW5XWlBhc011eXps?=
 =?utf-8?B?R0xJdmMvVUw4Y1VqQXZRY3lLR3E3bkFldlJ1L1dGeXlZbTBBVkpqMDFNM3hj?=
 =?utf-8?B?eWl2RlA2aU5nZklZZzhhMk9mQnhIMDkwam55QW80dGhHN2kxRGJCcFV5cHZ3?=
 =?utf-8?B?RmNvV2k0NHA2bHFORFdjV1E5bzBWamJTYU1CS3B2UEZmS29EYXU3TDA4OTJ4?=
 =?utf-8?B?SThYRUNxSnoyR1I1RUttWVpGdXFSZDREY2lvOVVNdW9PSlFnOWJDaTVGaGd3?=
 =?utf-8?B?TEludVhLakFLdGFvMmVOcHN3UE1UVXREYTN5UUg0WUtjeGRzVnBLeEp2TFhV?=
 =?utf-8?B?aVU0R0wyMGJnMEl1VFROWVpHK05vcU11RDIxTW44SVp4VWtlNUlMQlpOSW1P?=
 =?utf-8?B?QzkxWU94S3c4WTlWZEUxRjZvU1hqVEdmUEYxbUxuU3czaWFQQnB5MGdpbVJR?=
 =?utf-8?B?cURYNjNobFZVdU5rWkEva1Z1QXJqQVl2RXB2MURxQzlLaVJvTGs1ejZDdDFX?=
 =?utf-8?B?ZkE4OEltSjYxclphVE1xb0o1WDNzT0VkK3FjMllNSWJXam5aaEJxSnFvdkZ6?=
 =?utf-8?B?em40QWdJNXFRd3FIczE2NXRubjI2b0xYTm40cTI1WkJuTG4yRVZtUkIvL3FL?=
 =?utf-8?B?ajhPU1VxV3JwdVAvVzZaUmdxT0hZNnV4THh4aHRiYjJRaFBvWHlPSGRzMjdK?=
 =?utf-8?B?Z1B2djQ4Z0t3OEZBVFA0SzNBd05wVk5oS2FhSFlHQTN6d0VQVWRERTkvMk1l?=
 =?utf-8?B?WHpPSlVNT21aRUJPUVFib3h6TUVKNTU5VFF1UmZUY0RFV1F1QWI0d2wySnQ2?=
 =?utf-8?B?dVd4bk9IV0VHak9jaXFIM0ZFT1h5bkl4TEVtQmZCMStKbjZieHJnbU9HVDBs?=
 =?utf-8?B?THBRcGRQaGw3VFhUTEVsT1VEcUZ2OW9ZSHlIbE5leGt5a0FoVnJrMVgvZW0y?=
 =?utf-8?B?cnloQVkyQXN4MkJSUzhJYTl3N25CR3lTYVNvUlI0eDFYQVo4M1ZIZ1lUcm42?=
 =?utf-8?B?RWN4a28rS0E0K2JqUDRFTTlTMk9NdjdQdExWUzF2N0kvKytXRXNibnVZWXl3?=
 =?utf-8?B?cm9neEd6ZVdvblRnS1RnSjNrQzRINFhHL3gwcGNBak1yMklCTjNQcmZQV2FO?=
 =?utf-8?B?dG8vTURjVkhDeFNuK2VaR0pTK2NlV1VwTGx3R1VOQjdBT2RPNjRURWdiNVhn?=
 =?utf-8?B?ekU5elVKREdGaTZrTFlFM1IvS0Z0MzI3M2hSK294TE1XeFhIREFUemFsRmN2?=
 =?utf-8?B?Zm0raVZEcGwxL2poTUpZS2RFb0RKNmNYWE9WYzdrbEY4b1FST2JQWGJBeUpU?=
 =?utf-8?B?Z0Nyb2FVR3JheFZDODcvT0ZyekVQRHFMRHFzRDN0L250aGRZUzJJYTJXUHRM?=
 =?utf-8?B?bjFMRFlKbi9YVkZkQ2dKU05qLzYwejhLbXdCWWRCSWpPQ3NPVSttSlhZTFdr?=
 =?utf-8?B?RC9rTFh3NWpYdWl3Z1U5aFdPd3FKM0EzUDNDNDdtS0RXV2xlOWVZZml4UTI5?=
 =?utf-8?B?NnV4TDM3dmF4S2JZWTV0dzl4R1pwT1Z0WWx3c3JHVmI0L0lZdTBrSTNTR2RE?=
 =?utf-8?B?TmRCdnJRdGxDUG1ldUczbkp3RUU2eVV2UEFmWmpIYVFXckJ3MEtxS2ZnRHhs?=
 =?utf-8?Q?L5zDNC+4s9n+e5lQ7ka0kFeUlRhZrFrlNY0v8Lx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e90ea3-0b78-48ba-3a1f-08d91aac5683
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 09:56:13.7004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYjzx8EFO6LbmbF3yx/q91DF/PVr3JXKh2oW0VjuI1LDrvMAPq7IE7lmG28ZO8JZiu0rLa3meVEMTpECMepbJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7494
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBGcm9tOiBTdGVmYW4gRWljaGVuYmVyZ2VyIDxlaWNoZXN0QGdtYWlsLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBNYXkgMTksIDIwMjEgNDowMyBQTQ0KPiANCj4gSWYgdGhlIFdESU9GX1BSRVRJ
TUVPVVQgZmxhZyBpcyBub3Qgc2V0IHdoZW4gcmVnaXN0ZXJpbmcgdGhlIGRldmljZSB0aGUNCj4g
ZHJpdmVyIHdpbGwgbm90IHNob3cgdGhlIHN5c2ZzIGVudHJpZXMgb3IgcmVnaXN0ZXIgdGhlIGRl
ZmF1bHQgZ292ZXJub3IuDQo+IEJ5IG1vdmluZyB0aGUgcmVnaXN0ZXJpbmcgYWZ0ZXIgdGhlIGRl
Y2lzaW9uIHdoZXRoZXIgcHJldGltZW91dCBpcyBzdXBwb3J0ZWQNCj4gdGhpcyBnZXRzIGZpeGVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEVpY2hlbmJlcmdlciA8ZWljaGVzdEBnbWFp
bC5jb20+DQo+IFJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpS
ZWdhcmRzDQpBaXNoZW5nDQo=
