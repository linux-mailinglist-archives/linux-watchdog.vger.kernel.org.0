Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F5651F815
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiEIJ3t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 05:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbiEIIyz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 04:54:55 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2113218B35;
        Mon,  9 May 2022 01:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKhdZK0QpBaqCIaAQI//29CuFBu0ydhbgBpisj/ukyc3oc4ldH7zN4HTkCAealLwG6U3K7VCfyD+beum4Tqxy0vkx9pvsKbDWU4AeTd0uZxlrgf/nsblgSMZfx6FspqO39Gc8zS5E+IZovnIauugf9We5rhuTx8NkoiOX2e0S12fb6bHVUcnpOAcN0mHIGUVmWVs83gYiAPLIblhnCei2wTji+ydIZW7v9o7uDN5vBuTdtgqByQEsteBWfHxtrXOG4gZoD6MHLb4DtowvpqOWgPRvUe7ieIHsrLeTAZf5B+IxtRMXakOJVdcJGKnFitV0tMKllJBZTsegRkxnimJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLOOMttsHLgkaa43PNTop9SRqBPiv472izY82GxLVI8=;
 b=dxzhB9yO27dwAabUr66+c+H+MdGKXMGkxreyjHAXGUSMjf9LlhsjmaYYwEMs7iA3IrFaAt3CY6igBmtHNFcR3anTWEMHKApzfZZXTxxEI2HeSBZbdkR8OwhFjHIZwFz611GXLh77lcmpm3eZzv10ofiW2CR507tKZG+PeCvQ3CUg2ims9QIbXI7HGflDo0OyKRBjgXnDZtLURLto1ISgIiGbwW4P6IW8l2FG0YDya/zOkc4MGiITKS0oKy28OtHVYvVwFya+W3H6BgLo/iG/T7gxIG0bD3llY/g+dN+55CeAi1KSkUxu7ISOmyJmjTnfOX93ZrvvCsUfsivadboO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLOOMttsHLgkaa43PNTop9SRqBPiv472izY82GxLVI8=;
 b=Nw76cFpZ7fxgZz3Hy+UPgN80cq9BeZAtRKgk9psDku+k1u2Sj17SCKyUzvJqAqVvXCYQDt5HKLibpuyx++GRjJ+u34YbKNzVftXkmriLMqB+ROU5SK6I/edfim2/IVOGTKhZLEE1JjdaDcja/naNdVrE8BMX5tvUhpfYn+Wo5vU=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by OSZPR01MB9551.jpnprd01.prod.outlook.com (2603:1096:604:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 08:50:58 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:50:58 +0000
From:   DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To:     Primoz Fiser <primoz.fiser@norik.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>,
        "upstream@phytec.de" <upstream@phytec.de>
Subject: RE: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Thread-Topic: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Thread-Index: AQHYVhpl7+C9Xwxcl0muoNJvAIXTxK0WVvFw
Date:   Mon, 9 May 2022 08:50:58 +0000
Message-ID: <OSAPR01MB5060A0D9B7EB66F108F34AFFB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
In-Reply-To: <20220422072713.3172345-1-primoz.fiser@norik.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b4d21dd-80d1-4fbd-044a-08da31990991
x-ms-traffictypediagnostic: OSZPR01MB9551:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <OSZPR01MB9551648C49798D4F71EE92C6C1C69@OSZPR01MB9551.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gKOv2GV4XueB++tDjINui2mDrOQEwKKPaZj9H8ZRbR1SjO3aoaQkPc9oHFtlx9kHBF0wO9wH+QzAs8PXXlWX07vBs3EP4MOwF26RuRHrRhLRqJ0BYbcsnebGhKdi5Wh2uShABemY4RWpVcRKDOKJtYbMCA/y6XPCO9HCH9/7ez9Yv62xoOzzD4jCxYiKzxMURhmHiycWWDJ9RtzUjjWEZ0U4pp6HPjEsSMiLThtiVZaZAZ4THUL3cFdsqhS4pK030t99MrMe99RioSNSr/uonYi929ByaXifWTwbEGTpsGBzqI5Kp3GA4DRta0wVX3SztO0W7WwjwmzjGurGUYCiKT65h6Up1LyqZ1cI1GH8f7ax6BGWGG6VrxijKOxbjRPlzyZyS/ar7/FOZ0yDaCnovADvbBA1icpJRSG6FaeQaSGXBjIiSC06vNlQOxAUaWXIggki+w08S9Pc+2CurTBlfzuEqratFy+WzK478JhWt/Tj0Lcrhr+bAlk4WrUuLkpe1zpUriNLMb5vVRpSrMtrdjMLs0dMGIAa5bICeTTdXVx/JGvUpqqWiMvwG0iK4mk7Wm+Q5A0XuttjfSF+aXNUJg/ZUhJornjR17IWPiY5+zvTYyivPbY6YuZiwnekZgTKM9xnCMlOkLy+3hXHfqpuEY228y7noqaOPuYXV3P0SsC8W03+Aji1/WDGqLdJzFbNwOhNJJIkEasgxH25jrS1MQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB5060.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(9686003)(7696005)(53546011)(6506007)(26005)(122000001)(83380400001)(71200400001)(5660300002)(33656002)(15650500001)(186003)(2906002)(508600001)(52536014)(8936002)(66556008)(38100700002)(38070700005)(316002)(55016003)(76116006)(8676002)(64756008)(66476007)(66446008)(66946007)(4326008)(86362001)(54906003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mRIsnw0Xmo2DyRURCrC3EgjYapToiKaHSXbe5uWcQWMRWialkMp2cXoM+MmE?=
 =?us-ascii?Q?Op/OMQIIKE49AWqZ2lyjcuqivxMtigRXl/gDYlIyvDcqXXbH38htfSq2O1Fr?=
 =?us-ascii?Q?Sh3FWUF2VyPaiK/KnCNmrY/TYclvy9/EUKEn/JjkBq+zRyfjJ2wWQ5mAbOox?=
 =?us-ascii?Q?jXjsI5fTRHzAdWK+YzPmZcHnVw2GmXJM6E/3+M48iIvQE9vUmZ62a3PPDXvW?=
 =?us-ascii?Q?+zcNH2wHqkt4ID3L5+5KwpQtWCV8XvLt20HmkRd+hkCl/Sno+6hT2fAdD1Xb?=
 =?us-ascii?Q?zEGEY3QWh5Oqu7uEt8mq9nxyIVm96KR+y1ImnT3I+8ZqQQEfozBY1Ibkbq5T?=
 =?us-ascii?Q?vH0KK0YeZM1BULQtC+dfWNO1x3FxiZ4rMMLMORHiZO0KsiJgaDhXzsZuYA32?=
 =?us-ascii?Q?t11ZO7sBAAlHQWQgpx2FsRaQMuSOZs0BrT2GdsjSHvd4VLurv2TFTG2gN+er?=
 =?us-ascii?Q?L2c/1KaL7JygyOQRtnZeFZOVxO2XTsu4yAuJ/nJCZKSJ9lLpRrRYZo9/bDkB?=
 =?us-ascii?Q?RjM/9YVkqAUTAtI1X+Obqt1+yTxAZiiUS5/1PtuBejOpuH+B7LqV6geOAdL5?=
 =?us-ascii?Q?GFsE2MTI/dO2vt5Ko9t4UqFscb5x76ICLDF8Z2v1rs0J0HH8W955IEriJA5D?=
 =?us-ascii?Q?wmoPYU5p5MQMzOK/6y41GDuuwmRKgwzcIKgIjuTxs+7J3y/htNN/AU3Q2N3n?=
 =?us-ascii?Q?1qIUe0/B2a9yDl2ICOombwWdWszllrXzbx6K7TsHOuMWCsU96lu+v7V4kn47?=
 =?us-ascii?Q?giDMVkIstb5gTd/NWFKQV+p0/2Ntybp1VYChwylrP9khBB3H8R9DoEWN2Pd6?=
 =?us-ascii?Q?YSiD84Yu8b8B0nfFVwLD6L1H3jMzCefMmPcWGZhszrLdgYtKZ3me99BSV2W9?=
 =?us-ascii?Q?E3w79O3wOwebFA4csVZhOT3ilj2wwLOghrKxGmLbjl79AHzHv4zLLY8VCAzY?=
 =?us-ascii?Q?f7ETpPHyuBusFSIC0pyrQLXRssLaSMWUB0JcSNovh8rxUNjUhnl8vC6ro6fn?=
 =?us-ascii?Q?yiYXQgzqfQH8NrcTBrMefkWMwULfRTd3Iy3DcIe1XER8zgDBbqer+3Wvuv+E?=
 =?us-ascii?Q?49ylIzl9EzORrXIGZX64WFLxPI8il1sVAPnSW6u5XQFgXpfr+p4MkPqRXtXh?=
 =?us-ascii?Q?l/+qMitiSV1jL2aJyB4CIPayQaf/5B7Hh7wDKDP6R6NVqig1ydYQFETMvguq?=
 =?us-ascii?Q?Ci8DMuzYdIy5kWyS6k8ElRSQQjdzWMU3KPaPWIujudJ6qZPOnD5iK+yZGEWZ?=
 =?us-ascii?Q?mhVTvCvyLQ29E+h4Ob/2ulX1Z2wHKVvggl0NlBLoeYs+sDMYWu8Rov8Ptifx?=
 =?us-ascii?Q?7nr7rgf426gilwxyVEONRepVm1M4Q9q8B1zlXGZVFgSNXNZ58351hsaKCM2+?=
 =?us-ascii?Q?tYpZsgF+2XV3g/YIwcp1dZiTH34k1CjMLmp9fHQyIGkcbFFCMFGRPk3H3I0B?=
 =?us-ascii?Q?xL4i907d7c7Ogtiz96l5LgkdiHuMRgDK4QJQ5OpLoHqyHSwVHFS9TJUk687e?=
 =?us-ascii?Q?s/vGU7zTgKIf0FuXeT/nZZ9Bls6iOpD5cvzvB5D83nQEnHGeRaSpy67X6Uj6?=
 =?us-ascii?Q?4Ab9bokkDXVWYb+Np0Mes96HMKIyKz66iTCVAnANci28vuxujCmHvV/xBJ5C?=
 =?us-ascii?Q?IdRAWDB867VeviccxM+YTYRljLaNRo0P+3yDdaoaBKd5aLE6tDiKUaF9qq0N?=
 =?us-ascii?Q?v9xmYzCs30pitnJXMO1z+WLBpNjwxo/UFufp5cAv7p+q+xiII/Jd/U+CtgL8?=
 =?us-ascii?Q?qxqdrQWsrQO0QfMESHQtHjf+W5lDId8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4d21dd-80d1-4fbd-044a-08da31990991
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:50:58.6290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsthkNK7zsCRd6cjgxJkaoq+fc5vP5oftUBzivBo3pu4s/GEmxW5bw9y1zE6moFj58bQJ20CGFodlFCJRsSJeHtSYnfSbzP6+GQohK1dAbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9551
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 22 April 2022 08:27, Primoz Fiser wrote:

> Document the watchdog disable option which can be used if the hardware
> automatic suspend option is broken.
>=20
> Based on commit c514430c51ee8 ("dt-bindings: watchdog: da9062: add
> suspend disable option").
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  Documentation/devicetree/bindings/mfd/da9063.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt
> b/Documentation/devicetree/bindings/mfd/da9063.txt
> index 91b79a21d403..aa8b800cc4ad 100644
> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> @@ -64,10 +64,13 @@ Sub-nodes:
>      and KEY_SLEEP.
>=20
>  - watchdog : This node defines settings for the Watchdog timer associate=
d

I don't know if this is just me, but it looks like you're deleting this lin=
e
above, but not replacing it.....

> -  with the DA9063 and DA9063L. There are currently no entries in this
> -  binding, however compatible =3D "dlg,da9063-watchdog" should be added
> -  if a node is created.

....here, if I'm reading this patch correctly. This means we're losing that
property description, and starting a text block with the below text.

> +  with the DA9063 and DA9063L. The node should contain the compatible
> property
> +  with the value "dlg,da9063-watchdog".
>=20
> +  Optional watchdog properties:
> +  - dlg,use-sw-pm: Add this property to disable the watchdog during susp=
end.
> +  Only use this option if you can't use the watchdog automatic suspend
> +  function during a suspend (see register CONTROL_B).
>=20
>  Example:
>=20
> --
> 2.25.1

