Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C75658D723
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Aug 2022 12:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbiHIKIN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Aug 2022 06:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbiHIKIM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Aug 2022 06:08:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A9C1FCDD;
        Tue,  9 Aug 2022 03:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2dCaHcJtn5pJKQTtMGCZDdDw63gBwm/tbXiDGI/pQsHVXu9irfskzRQ8vPJv3ZUP+p+feXy17nx+ldiZKAiue/YtkwX8rSjhh/hKGt7QyBLHFNbbYJJWwaZxp66sSjsIQ1do1zwWaNZYAdHQLaB6reOGETeRgSe78+wiPYtpaMjfKx/2tYDv5HNQ9Cqx53ItSjETxpUjvLwnaC7ilgMsfMYWl86URhGpGfCJG9+fHFfrBZB4gchWFcJV6eY+bk4C+CEe+WnMJ119KeP4om+x6IHQBcUBEgv/aqmxlwXBSrkqu353twlthQ7wCeCuDtafE9GCtHlrxOz/oOwXpyHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTlVRRDy1LyFMfspS8wnaNsYC5kSFSBJ6bqKTmYpsZo=;
 b=V74Bp+d9yBn8AwRQ1ZbK1is5TF+/+qfxnQkwRF0b2vD02+2mG9mI+vxlWmB79aRc1qHEtoXIYEeLJfynXINLWNbmqrnkUEnNHGW37zZMh6eOjsuUQK76DR8xws1ESAX4aQMk8VSO6U4gPg9uRWovMFAoEdDoKuuWhC4J5DrUxhQsBxEdORIYo/xi23tKZ1owRt5vpOscCsoAfTGRU1YMYu60BECb9hCofol+SMT9uzfvEI+YCuEcUZkHW7rTPIRqmzXZ81ITktuC0ZvKDEFKnztAInb0JRY9EQGlPRtPLMbLL7bd2SjLaBkLRWWQgsQ9n38UqWEWCvHiqOLyrQM6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTlVRRDy1LyFMfspS8wnaNsYC5kSFSBJ6bqKTmYpsZo=;
 b=oAn5tRLdu8gbqyog4hrPkRojDPU6GXXa9xWeuxVg5C+NeGelire+9wnNk7hyPOkdq+z6coSnM7tZ9LbmqFMKrxuW0cEEh8WEdu7OWv5RByezTbTOqz0I6yw/FQ8MAqdhOu/MqkAFiR1tflc4Ubp4Rcy91gYfqFElHMWNRRlMqdc=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB5135.jpnprd01.prod.outlook.com (2603:1096:404:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 10:08:08 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 10:08:08 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v3 0/2] arm64: renesas: Add RZ/V2M watchdog support
Thread-Topic: [PATCH v3 0/2] arm64: renesas: Add RZ/V2M watchdog support
Thread-Index: AQHYhJAobYFLjwf3H0CsK64vdyaoba2mpcOg
Date:   Tue, 9 Aug 2022 10:08:07 +0000
Message-ID: <TYYPR01MB7086CD7B19286E92A83BD674F5629@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220620102600.52349-1-phil.edworthy@renesas.com>
In-Reply-To: <20220620102600.52349-1-phil.edworthy@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a679aef-f5e3-4f89-beae-08da79ef0edf
x-ms-traffictypediagnostic: TYAPR01MB5135:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J7ll+ygDN6cSP7KOwQwwzJeU2HFbnxvGgf78fHA1rQKjXC//EVmLF7dLvklDJkeAjM0WpbisTw0JVZFEizaOdsImxxq4Ju5r2Yw0reWgju42Y9fVL/0s0bN2VrIt5Hrej+8OH1tFPGlLV8Ca8sBCMv+LVeuOVzSYwPMLUfMpOl4kGrWxsON3D2lGY9HFpzvE3MzS/aBBTxBPB6LK/q+Ehd+blMyZcYuRc9dcm+/lkRDLVnGgeEFeyaYa7C5iabmXThw+r/7cctz7ZfibOQVeSRXsrFnEXGb0F4LosmK7YVPXpv98lZiWYzEEjvC996gyXqtfDzD8gOKcsgNuRLe0qpi6B68IjhlrzfIH8BjLJLTVOi5r0aGIfoFxAZq3ZHZyMQu2KL6abhE8njIQHElnHOTQLkT3+2zjgHrnPrBfzQ3r0C1bOLzzDw27D02BHyQ6r4fEzGTsC1LCVh2ny663whjADrJIQ/R/b6Lxo/6BSezkYO5WoTJKNaIPNbJOcXVDSgqpK+qxk7rODdLo5uuFW/BEfDYpDqgpVltj0++hBIB7NLfBcVIJOfjEPXHNfCGOA5oemHxlKZH6Y0+qYbs4gAPXmNpiqbC/992mlcofB/c32hvb22t/+YHWndhFnsmi+wycGZA0RxW4ZBaKgFAXb9p5t53GPdmq+LukwdSRJsZ9AlVASm2h7c+oqVu7vKpt9L5WEtb0+8n4qpm5WZXTU57aictDye3wZvqtXvSxLxSftBkvgyoYcyfNRZZSHQa0H5VcbLqEJ0bd3cSJJ1OdpaVdG5lMWrHhkAOqp17RM1SqCTVFHIPoLuUu0C9LZBKV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(4744005)(6506007)(7696005)(186003)(53546011)(8936002)(9686003)(4326008)(8676002)(52536014)(44832011)(478600001)(38070700005)(26005)(86362001)(41300700001)(55016003)(71200400001)(38100700002)(2906002)(33656002)(83380400001)(66556008)(316002)(54906003)(5660300002)(64756008)(66946007)(6916009)(66476007)(76116006)(66446008)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jQVjPoOIv9V8o6DW7jA0BMCDefxdA9xcNkalETqn/e7PcU1d0qRYPOJ3kvZ+?=
 =?us-ascii?Q?qigktLSc4QJkDQOPknIy0CfUG6ofnPqY/74zzG8FsxyhJNDY8wNQ6BZwIHkD?=
 =?us-ascii?Q?laC6e0DBiEz6SFSUqs653zMFurszpbRKTtGetTDHabIih21A8mr6o9iX5Z8X?=
 =?us-ascii?Q?URyJHue4gxRz+glnyU/ocNsUGGFxOQRLGWR55QKDAPk0/Et70oMFLtb3URVX?=
 =?us-ascii?Q?lfkgYLVRCvlRHUh09IlCmxItVDIz6fUnL1neJfl7UU9+aY4zAxK9+6R0q4hc?=
 =?us-ascii?Q?eN3ck2mq99oWjEamiK1+CZrhLHIwfxL8eH8vmq4yzIf/8GrE+SEoo2NuB5KW?=
 =?us-ascii?Q?Qs1RqQb6MymFU6vHfwd72ZY19tAMWV699LuWU795vVmeA5e0PC5ltrsuMyXV?=
 =?us-ascii?Q?Iiq/is+eukS8qjdTh3vEjC+YhJKCbq1ydYqCT2quvOUNkVzyeKCiqWI8AXcF?=
 =?us-ascii?Q?LEfHz+GgdAR2JU67xh0OmHpnnx8yK6Ue5UW7ScY9FrShc3UB0s7p+KA0feSV?=
 =?us-ascii?Q?Ccaq+hmo9ds4Z3Ad1jwUYzUmKrqZi6vl1Lh8Kjwv9TlSVDzU6YcnFmTkPfjJ?=
 =?us-ascii?Q?v9a7p8XvBH8hoXfhdFyIvkjZwTPDchrtfW3XpymFJLpbYwIFLQ7Mtg1RW0bZ?=
 =?us-ascii?Q?qzNlTa7oin+7jCwtGb0eBKfqjHRIQnVDDY5PmKVF+QnHTGs/b5Jk91fs9GOg?=
 =?us-ascii?Q?uI988MBOgZ7gF2cN9t/tatJ2e6yAiU1z+uH5zdS1nZ4ZihR74b5qQaDM42Ji?=
 =?us-ascii?Q?zXAoCnKmyDI5TMV3rjujMlUxkxLI4jSoSHOScwqrwYim2RHnu1UhbTszEFqE?=
 =?us-ascii?Q?YyDKhES8MWIpcsVYHm4IRnlGXOXBRFw5uLzCwSW5Rq79s9T46KAcQDZNhpoD?=
 =?us-ascii?Q?34n6eRLZo6SFGWHhh07xzlP5sNoFrN4ARn4eHVEMKWepuaUZwSBf/i9JV+wj?=
 =?us-ascii?Q?JiuFXIbMfUakZjHm6w5BGOLwW52PLE8ZeOvR3boo2Q/YxPFSId/etx5WU2YO?=
 =?us-ascii?Q?gM/IaYA01upBitVidzF5OBj1QNDHiHo0lXtFcHVVkogJQArXQDqhbPD05euB?=
 =?us-ascii?Q?zH60ojxN0L6Pg3PeM+hXT23wt63O2EsKjf3nPDP6E5joenJRU8vzt4GzCx6y?=
 =?us-ascii?Q?fJxNcvmP29GbCP9I0g/cPHraWt/VsCcVFfcZ77lCURAzQ+KksGv0ikjvG2hO?=
 =?us-ascii?Q?K4zCHK1+/eGl0Wu8W4gHhW1LdJBrBQ5ByaYI8e6R4myMogNUkbzjdH50xJLq?=
 =?us-ascii?Q?yx1P2+8alozXR6kDfxU4f642IM/H2Yf2fJRvF4cMXSPbmvFgBLakGQGUUlZZ?=
 =?us-ascii?Q?vnMJMqV7Z4awhMUbWTf1M5on90lEi6bxEZQlMGMHd2kDHsxp+uOujfOIdKnH?=
 =?us-ascii?Q?15K1j1ucwHnZ4IaRLY6w87GyCjisbAA8MDZnDXTzVEfaX84F5SBFu/1mC0Q+?=
 =?us-ascii?Q?eIxG9MN1vWFEUzYjG7aQYhjfmoPo3VtDxEctE0nMaw740GEB9ejdiEhz3JmE?=
 =?us-ascii?Q?gnwwmc9ACG6bPbePdaVxlnkRp66biGDGvEO2qlso3t2Bg438L+59OuQ9Vm+d?=
 =?us-ascii?Q?DxotfkuIVn60di4/VyezQUyl/JXrGH/kjuB1MgSEaHb+fB2Y/H8G9+xH7vQ6?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a679aef-f5e3-4f89-beae-08da79ef0edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 10:08:07.9722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfgHdLl6/fOnp8TlAbJl3p++ybJ1T3bqNCgrnWRPvfabOx9HDg3DLy8/1SLmgBVDwv8wN3uqmpdzUS+JTjNc712CMxbHkwAZUzNYU0EK+gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5135
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wim,

On 20 June 2022 11:26 Phil Edworthy wrote:
> Hello all,
>=20
> This patch series adds support for the Watchdog Timer (WDT) in the RZ/V2M
> SoC.
>=20
Is there anything blocking this series?

Thanks
Phil

> v3:
>  - dt-bindings: Add check for too many interrupts or clocks
>  - driver: Don't call pm_runtime_get_sync() in restart()
>  - driver: Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
> v2:
>  - dt-bindings: Added minItems for interrupt-names and clock-names
>  - driver: Replace use of parity error registers in restart
>  - driver: Commit msg modified to reflect different contents
>=20
> Phil Edworthy (2):
>   dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
>   watchdog: rzg2l_wdt: Add rzv2m support
>=20
>  .../bindings/watchdog/renesas,wdt.yaml        | 73 +++++++++++++------
>  drivers/watchdog/rzg2l_wdt.c                  | 39 ++++++++--
>  2 files changed, 85 insertions(+), 27 deletions(-)
>=20
> --
> 2.34.1

