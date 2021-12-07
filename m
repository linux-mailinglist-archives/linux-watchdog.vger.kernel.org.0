Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5023146C052
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Dec 2021 17:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbhLGQLO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Dec 2021 11:11:14 -0500
Received: from mail-tycjpn01on2126.outbound.protection.outlook.com ([40.107.114.126]:34535
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239446AbhLGQLN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Dec 2021 11:11:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey9fqS5v08rwdO2u9juRdOhZAgLEOq430Uo1JjAQV7sN47hn57D9N7XyRjpOwrTu/+NnQpc8ko689bgJ+k9dVDudhucEg3gZ3BygA7Oh7wX35GXvwAXfrLjdQG6+Eo7XZbmAnh2FUNmlGdMNtTOrFNQOFKq5aGW74fOP3TF2qe+b9umdU8HRbExDGQrMiok4VRAO1SUrmdHY5Bjyq9On0FABj5lvjEZgfK8kPN8TN2uqrFOCbZ+p0ebKebcnMnWKyJFjcD9Tq93rTFbUZ+ZeIaNlG3tzd72Ip0CcWJiityp3OhrXhekp6istrCmxZbi7jLvXyW1Q2ldKxGP1hRx5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bznt22R3d57Lq2JVCebFTtjRZqPQk2a/pFJHyVhYU+U=;
 b=aewn3I/1mfkNigmPM5Iy826UIdIsTmeuL8s6GH/gOQ2+bJRiZAYFI473Y1JhlEDOSurR9rq/zsJ/OIvcL1//DtBZI63bikz4Xg7uO9iHO49ohTbpyl+kgkB8lwNzt+tIWDTYpmZQQrTQqXWWmVrGMNQ5ukEatuGXhrw8JTlIreTNZWWH/FdeR9gAVMQqlwVCz3jECmIZlj6W61oD58j9DWGvF/XHdYAzcdXyXXbRFVGkAZWEF2ZAocwCSWhumyKIftEJTvyNFZ0ORBdXcz986l2UK/PI5SR+5PdURj8OutPY/yDWeYzk+JFsLjU2CgmsMsnGlP5kc20swzFPF6D70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bznt22R3d57Lq2JVCebFTtjRZqPQk2a/pFJHyVhYU+U=;
 b=tWhQ5Mi3QjN79z9KsrOZcPED/t0eNHGNs5Xo99dVEvRvU8QYW7F0BudVSe7vN+T6CAlDP3I2n+8avKW5+KXDFtoA9hGOe/o7BQS3aHF/092We7Z0nK9gMPfO9KSY5CXkqaxvpG6wCRpyPwt1lPInP38sTZmeOMibsEr00rA+n6o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3889.jpnprd01.prod.outlook.com (2603:1096:604:52::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 16:07:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 16:07:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/2] Add WDT driver for RZ/G2L
Thread-Topic: [PATCH v5 0/2] Add WDT driver for RZ/G2L
Thread-Index: AQHX5iQHYyCQzOYY50q0akJw+QU7QawnPDYw
Date:   Tue, 7 Dec 2021 16:07:39 +0000
Message-ID: <OS0PR01MB5922D81A09F4B51C771FE6D5866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211130195357.18626-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211130195357.18626-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d77ca3b-ce3e-4195-f2df-08d9b99bb176
x-ms-traffictypediagnostic: OSAPR01MB3889:EE_
x-microsoft-antispam-prvs: <OSAPR01MB388933A2CEBCB4727B717A06866E9@OSAPR01MB3889.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kto/HP9IEcNAB4uf9cc55Dm+TluD8x5DQN0JRD6HXo7IMkInCLZSYvg8NqdEKZ2x67o7C7iypbRjDYfa2iAWZ8YS7Yc4T+/P7lJDW042wdWH9UTl9ZWcakp87E68GjIwzREjHwinn6OEq1yjYT8FNymN3YbaJ8MeDaEqFeRL2hg0/k5HAlnalFqxO7XIpFg3n+mN1m426wyYLA4sKpcnOuSXUNCl3EFu6+0thJh0Tz8fcl1l81KSK3UPkPUpKcEBVJQWtd9o8L2EGCcTlKvlIVd02v5ee022PchVueNLYnCVo2gBt9evRaZovkIgSVAzRzaJcc50Msp87WJvQSbXd5nGaIptWOlXiU5TWb+VsNSaZAmQB+Is+/7gX+Sh3zy0eapW0UBuKn1iZMHcAHOkaYDDPaReQuD9rEiNc6UVddETWpxrIW9dDJa/SCwyXkE0L8Y6IprHrGS3lwL76eIGnhket0melcQQUsNm9WOZtx/nP7w9clBuY/4VIh9H+ILKPDiAPiyathQwFJ1CUpOCE2SEikoNBotzDSikd5GwLzCCkHgs6YFn4qEvaomUdT/gAPJMLKCDltZGVIaf6uuvihqBZXIrrp+34rcLwVHYvGBpODe8PDphLO7LF25KzxXTWM+D8iyKNdeTjpDl1PPpEA5XGnF5Zwaf06YSbCZtYZLbrCd/dxhUyBOlK2zZHYsCetchckGOk6au7djOmSBq0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016003)(76116006)(7696005)(508600001)(54906003)(8676002)(71200400001)(66476007)(83380400001)(5660300002)(316002)(110136005)(2906002)(8936002)(66946007)(38070700005)(86362001)(66446008)(64756008)(66556008)(4326008)(186003)(33656002)(9686003)(6506007)(52536014)(122000001)(26005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+0K3THCZmoImHDFBKnkkANFhllvgR1av7ElDv8LLNs8Xk4RSawHYT8n/Sb3u?=
 =?us-ascii?Q?mMZmm6MxUtrv5LLdYOlimLCQh6i0L06p+Ybfk6O3SqJasqQ6vtR7z1KYmwSB?=
 =?us-ascii?Q?sDacTVgTOZ3HH7F+toH8m+KOHVJt3PKIldnDZ3YuT4BNwaR7F7AYV2r52JIP?=
 =?us-ascii?Q?J2IW97xC/ZHdEkB5L+52jph0RHVVXJRmN5wWLqmVku0FMTaH6Ro8zh97rupj?=
 =?us-ascii?Q?YtetEEVRmzuTRZU0l2cPlQU2J6gzBIVeHc7f8pbEDoehtDuHV9ivMv8wj3hL?=
 =?us-ascii?Q?f/8ryb4Uyq9Qy50Cwd8xrVuKEkmPBu0OaKMQvWqW/V4XA3RRLqwjdPVLtcul?=
 =?us-ascii?Q?5sEQXiTFcG8uoR/DdkR4K+5znoyvRJBPeZ3R8BLjr4NHdo7FCNiI6oBZdMgw?=
 =?us-ascii?Q?oIaQD1iwxRhoFi/Gky3AZ6TWGKmbOJAJDlpi/0Zzaztc3IIT1GVl7XVyn9Ar?=
 =?us-ascii?Q?LfzR27UP90vLOqONDCpG9szCgfqQFOULRQaBDmpQw8cXR+dpW4A+2iR2vJuC?=
 =?us-ascii?Q?cOGwPGyEZO1XCSRyv/dhFbKoWPuWe1OJj4ZooHWVmn3JzEz1FcS/5v54iusk?=
 =?us-ascii?Q?JIpnUXLqleeXPBOcF+zgrMWXU4MRKQzr6MElkXOKJW5xixUT74GFKM7s8UVd?=
 =?us-ascii?Q?Ewnsmb8FZVljVDV/pYLkI1X47NEMv9nhMYDh3VucKplSDoUnuxCIVB4aoCKS?=
 =?us-ascii?Q?6BKTeLa7MzCQHhT8Pf49691HokWCuL6qvaxnNHc7PNqQSjrJLNgcm4l7gJRD?=
 =?us-ascii?Q?4315Cb2k1GKHJuQOja5KBZKx/ebQp1pzCmcQ+7taUR33Ob8ra0OImU16/2L2?=
 =?us-ascii?Q?iuO5Hy2beGe7CKxq0AGWKbY0HI08yPcmV0L1uF5rPSa5xMidbTqqohhSJpsm?=
 =?us-ascii?Q?priy+pA+N0lgMy/SqyXQGCcNIvrarrd8EDzI21YX5vbE1DGZthofoelw3ygr?=
 =?us-ascii?Q?LgK5svU/gRN9vqlFZnAJ1FI2T3C7OWkoDi1vTi05/YZyVCzr2NBQibSw+5gU?=
 =?us-ascii?Q?6aWfGBiAd8pF5lea9UK7gZ2YLwYorhzj3opP8S5G+xrQpcFKmhGJliHWWsY1?=
 =?us-ascii?Q?/WZ+UU7XOtR/eYJx/0MMMSPabqIZMZ8v4dyDhy2X3tFkbgIShycpLqj0ZZbn?=
 =?us-ascii?Q?CtajWWOsNSS83VfSWDqQmQC/P/YGyypkw3HHTF23Ks7hpB3K3KAbXZW8d2b1?=
 =?us-ascii?Q?jkkQVozubJ7zPt+ha+8NWj5Le+o0om/s6aRkkOetcL5jMxbbISLJe0UHmk82?=
 =?us-ascii?Q?sC+MGUVuSXCfcEea6ZNpA0CkVrbRCnudZCF1L2ZBWLk1wl1DGDHw8uc2xMot?=
 =?us-ascii?Q?1r4zUQhKyFapz5V/+T6JZ98YZO83zYou6QNtLI6kPg6HM+rfLlRItoFXsot0?=
 =?us-ascii?Q?Gu5yvZYb5nPf7TUnc2m5GJaH3J3sEb4YLvfrMO+gz5673wXBji7l25xQR368?=
 =?us-ascii?Q?JwLgwHibSmwnKnM9i/Ml2STYgomwvNyIV4wQDSG2sKJ4PAcXmk4Urur+DpuD?=
 =?us-ascii?Q?AsWlzVEbUSOH94FogTh9J2chi4BcT9K6vjmSutCrsrr5Qv0R8wyhQ6cyKfyF?=
 =?us-ascii?Q?6zwN9HwhK/a6mv+ik2vYnOwq1rtTD6fluV87m7uFryKtChyi2Wr5EURDDTV6?=
 =?us-ascii?Q?kXGH3ANs5NguvK51ZAuiNXUNJBjx6PgqrRIEQa9ZpMAvxg8OCjiEYbp+40Bd?=
 =?us-ascii?Q?Y329SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d77ca3b-ce3e-4195-f2df-08d9b99bb176
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 16:07:39.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7dSreklb19Ry8Frk6AqGFTcrtij8S/1wlTCIWmpOKF67gkjYfj9PH8nMXJF7+LWmXRVGwcpuMt3fab28hjgPzaSIbC74LYAbH+KznRAHEiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3889
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

Gentle ping.

Are we happy with this patch series? Please let me know.

Regards,
Biju


> Subject: [PATCH v5 0/2] Add WDT driver for RZ/G2L
>=20
> This patch series aims to add WDT driver support for RZ/G2L SoC's.
>=20
> WDT has 3 channels
> 1) CH0 to check the operation of Cortex-A55-CPU Core0
> 2) CH1 to check the operation of Cortex-A55-CPU Core1
> 3) CH2 to check the operation of Cortex-M33 CPU
>=20
> WDT IP supports
> 1) Normal Watchdog Timer Function
> 2) Reset Request Function due to CPU Parity Error
>=20
> Once the software activates the watchdog timer, the watchdog timer does
> not stop until it is reset.
>=20
> Current driver supports Normal Watchdog Timer basic functionality.
>=20
> Tested WDT driver with selftests tool and reboot command
>=20
> All 3 channels tested with below command.
>=20
> cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2
> 0x12800808; done cat /dev/watchdog1  & for i in {1..60}; do sleep 1; echo
> $i; devmem2 0x12800c08; done cat /dev/watchdog2 & for i in {1..60}; do
> sleep 1; echo $i; devmem2 0x12800408; done
>=20
> v4->v5:
>  * Started using the macros MICRO and USEC_PER_SEC
>  * Renamed rzg2l_wdt_get_cycle_msec() to rzg2l_wdt_get_cycle_usec()
>  * Fixed the value of priv->wdev.max_timeout in seconds.
> V3->V4:
>  * Fixed the build issue reported by kernel test robot
> V2->V3:
>  * Added Rb tag from Guenter Roeck
>  * Removed Removed patch#1, as the clock changes related to WDT reset
> selection
>    will be handled in TF-A.
> V1->V2:
>  * started using clk_get/put instead of devm_clk_get/put
>  * Moved devm_add_action_or_reset after set_drvdata() and
>  * removed redundant action on devm_add_action_or_reset() failure.
> RFC->V1
>  * Removed patch#3, the clk patch is queued for 5.17
>  * Added clock-names and interrupt-names as required properties for RZ/G2=
L
>  * Re-order clocknames with internal module clock first
>  * Removed pclk_rate from priv.
>  * rzg2l_wdt_write() returns void and Removed tiemout related to register
> update
>  * rzg2l_wdt_init_timeout() returns void and removed delays.
>  * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>  * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>  * started using devm_reset_control_get_exclusive()
>  * removed platform_set_drvdata(pdev, priv) as there is no user
>  * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the
> default.
>  * removed remove callback as it is empty.
>=20
> Biju Das (2):
>   dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
>   watchdog: Add Watchdog Timer driver for RZ/G2L
>=20
>  .../bindings/watchdog/renesas,wdt.yaml        |  75 +++--
>  drivers/watchdog/Kconfig                      |   8 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/rzg2l_wdt.c                  | 263 ++++++++++++++++++
>  4 files changed, 329 insertions(+), 18 deletions(-)  create mode 100644
> drivers/watchdog/rzg2l_wdt.c
>=20
> --
> 2.17.1

