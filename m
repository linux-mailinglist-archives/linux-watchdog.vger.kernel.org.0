Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC8A3C14EE
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jul 2021 16:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbhGHOSE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Jul 2021 10:18:04 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:5057
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229592AbhGHOSD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Jul 2021 10:18:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC1roWVEsiRZJvWwKu5VNCOXspbuTRflglHbMFxjHj/31iS0htsrVZfpK+AClmoTRICo/oq/Ww2Nd1OlnN8mLo24UmcGUDZ1O3BwaOr+3bt6s2+dkTv4mEhmvxwjDtqjEwWoxfK7vX0lYp1r9PcC+Dl2Q8nXyxzbqGLkph3ZDq98TNTy2u8n3aTZjndga+K3/SbcYpVv6+1u685fitDVjs7ZeEff1zfZ1Nr39nEmHdJk5mwgUtMzCxmmKiDrKvg7bklbJ19csN9MPc6kQw6fw8lniqmM8XrJeJTBnKI5wbbWwf/mcdxcx4ApM83Rgrq4iTQl4JGD1uY+u3Pt7r6TfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w79xbzefcbrzbYqC6ZXvVtn+JXcVQeqoP4JFj9sUmtU=;
 b=OJnQsaSJB3DnBaWyqyzEtufD9FDbgnSuNmVWcnKcEmDxEflPZaZuX7ZlDSc/1qTT8QhuCBH/o9h185duI91TuqNOIFbqTIA5TKODdLeZD8FYXT1xJL5sa1O9cPXBxR6KSDQQJCOv9UfUHeRf7UVf2xpi5obv6latbSn3qvWlgsRsxh0oBjALeSA7sJ2pON0U485eQqV1UWoUZVOZ5lfJlptDI55VcMmUov+pDHlsbiX0/PwnF8+0iWur37120IzoHCryfMr+PI27aeNT6W2jK9HOCHnLHmbI113LJ2GT8nOEwulINewubNq/dLvmzrEeuOXInu0l+NMBrnwOboQR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w79xbzefcbrzbYqC6ZXvVtn+JXcVQeqoP4JFj9sUmtU=;
 b=P348dF+XJBq5VnFPYBcC6tFYEydDSjFrq0Oee7Bwso+KkY0FyNwkNTsAWzey71oeVLanjcU3+El98GHTxh9zUYNm/3cJPs2lOKW7DntelnynEegiOqBmrO+NoJE4vMRMocnqhA77MEC9LiIez9fTB16Uq5y+qD09zxNZgw6cPDY=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR10MB1752.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:3c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 14:15:17 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2832:8aec:2f16:aed5]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2832:8aec:2f16:aed5%7]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 14:15:17 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Primoz Fiser <primoz.fiser@norik.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v2] watchdog: da9062: da9063: prevent pings ahead of
 machine reset
Thread-Topic: [PATCH v2] watchdog: da9062: da9063: prevent pings ahead of
 machine reset
Thread-Index: AQHXc9JFTrHAshpbW0GRfEcYAZERnKs5Hz1w
Date:   Thu, 8 Jul 2021 14:15:17 +0000
Message-ID: <DB9PR10MB4652FCD8EB538492E66BD52880199@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210706112103.1687587-1-primoz.fiser@norik.com>
 <20210708082128.2832904-1-primoz.fiser@norik.com>
In-Reply-To: <20210708082128.2832904-1-primoz.fiser@norik.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: norik.com; dkim=none (message not signed)
 header.d=none;norik.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70fed302-38d7-4978-2556-08d9421acfef
x-ms-traffictypediagnostic: DB6PR10MB1752:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR10MB17524ACEFFFB94F24A79593FA7199@DB6PR10MB1752.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLgvHWYcKrJVd4fYapbBezwAMfSPjF5QC+yy4l7I+EzVKOCfgFxYC7J+R1JdhEG0bX2bGUO4P56QxQSXUobA1DUewLTXUi+KpkfLMSwo3rw+kv7O+PiqXjDu1KtplRiGiReohZjAqd0OQhg3quURlhwiMtCw8RBvGwJhOazEjXNILNHYZ5ABib72qKO3BkoEq0V9NSknTxIYpVCGn7bWnlsA9mUVJZ/hwWZYajhpROAxKP6nDA3cx8ghyY5fZZKlpQZDGSwhCaKEDxaSFYIPwcGeodXBsL8V+I+tJCsdB1GzjLHxfi22FSKJyKlP/ivZjcZ5dH6ZLJZWMFU0s62guPTgz9zWdiQh9jIAn+M+cugGxirWQStKOEmQoYDxeILITswEOGDicdl6ngVYAA3w10EjHhEE18gJkETFRZslL2ecHUVULyPGiwBv378SZL+J9RiajJQLJQi8hrcI1wtfqb6y+OOXePx8SUByGGeuA9TGSGuBi/20j1a82fVjTXpfe2JWSVJ0ifCTwA611vrLo2zNJFXmVe+516iBK+noVM7S5eCTb0AzPwjmsl+xY/9SO6u4LUvcRZNVDSXv9FXNllfJ3s9kyK2hatX4KH9OO8qAEPF+9oW7loFITf2dn7llzLk0JzaR/388F7XA+TiYDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(110136005)(54906003)(9686003)(6636002)(86362001)(316002)(53546011)(2906002)(478600001)(5660300002)(55016002)(66946007)(52536014)(38100700002)(6506007)(76116006)(64756008)(66556008)(66476007)(71200400001)(7696005)(33656002)(66446008)(4326008)(83380400001)(8936002)(122000001)(8676002)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JWbkU5JHJqqJS6VAl/35CelDteXek9IcCz0DbZTRIagUkFgR8KSoMwQlET7S?=
 =?us-ascii?Q?/BOEyF/WB6EuWZaXyw9Hjhu/5FsbKmxTZU6w9yhALzogEbxsFj6yXQouORXk?=
 =?us-ascii?Q?sPKIc8FUjvFHVYkHIQCohUFn7DQR3XB2JWMW48au8Z7EPQB+s6Ie+W8Pf2Nd?=
 =?us-ascii?Q?WhnUoRHyTVGPa+ZDeDYe69by/Mb4gjhaAIIm6SA7zCVU5w7OcysjUvZ2DbTO?=
 =?us-ascii?Q?S9vn0hh4g+u3Ak45JAoqrw4qTMYd6m2468rhIoZ9fU1382kBeaCgRCUsZhcD?=
 =?us-ascii?Q?LqvPBpr1HR1fUtvsy2Ut6eiUQL3BbzVM7wPgKedvoOw4KCwDEZ4dCWT9Nx0Q?=
 =?us-ascii?Q?cjGLoyit1DPjML6Lht1uO1rIiLrxplzEg2dnTFSKyZSICahlC33wm4NmfzuX?=
 =?us-ascii?Q?bQPoxgF8hQuSUhjDHoWQbt+zysJ0bkVwdiW8fVBg84+VgoBvS9G8clVTYuKq?=
 =?us-ascii?Q?glNZGGAgTzLnlOOs+/TyCYbKN+uGdW1L7jmSeZoI9GxwSZn1BIvlN1ny1pQV?=
 =?us-ascii?Q?SxhbNl8iNh2dKo4cPHeuksY8NUlhyEjyb2+9jOHHuWywCZB+ZzQhH5t/K1w7?=
 =?us-ascii?Q?WJht+Yxcufno9xn/aKk2y4RB/LZ8aNR29hkOEPl+rrRJcgw6bR6OWkuZrBqP?=
 =?us-ascii?Q?hxAESEsX0RSfrq+lH125ERhIiiOdLo/3p2qIffK61kdrkNfE+YICS9muMSIX?=
 =?us-ascii?Q?uyp5UZkkKH5jsIbu6U07FF1/6QYhJcghBnROfMxCAe5rUWhM449oULQRRwm6?=
 =?us-ascii?Q?KAbIjIRZK8NIPTo3OZeHnAsIVwf5Bi4q7ibh2qWuaBUa8RLeBM0FOlTMRW1F?=
 =?us-ascii?Q?iuVx6/MSNWigfed7Pgk3hUMq6KWsz1VFU+6Ppnle6V1QA6l114PIRqA4zFQR?=
 =?us-ascii?Q?mRoSfXM1RU9D1lvvJSNyifaCbhkSA66mdWp2fsDqoUxbeqEy0pvb9XlWW7Rd?=
 =?us-ascii?Q?gulBMD+CNw1NU8+hBZjKD/jCyuEw/8GR21dBQHYuB4/0TEGjGHJyJ6Ifc87X?=
 =?us-ascii?Q?cHWQPBYBk4Hq7YG6MIwMVhAVpLlEJ4kF4KHnosvGA/pCEdluhBp6SvwYfcbN?=
 =?us-ascii?Q?cDhtth3x9LHwoyVRdE9Fvb5Dbq7x9DbP1aCx7vHKCU6eASRBqPBCTAgRymQr?=
 =?us-ascii?Q?cP+fNLWnSH46LtRrev2pbtGE2blKCPxZ05eAPlTsg/jKMDdcXzZnZtO+cXYg?=
 =?us-ascii?Q?kqQ+eXhzPf8PhoLLiqJaOa/b4OCbeJuAfRtGE2glbS9Jlkvi2C5ow+UMbWFm?=
 =?us-ascii?Q?S+jhkCivfijAtHfCNljeX7MspyPpOINVGdsTyOXgn2jonPPpoHF3GDGGLUac?=
 =?us-ascii?Q?sFvKnxkyweBsSS0NTyUPgW74?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fed302-38d7-4978-2556-08d9421acfef
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 14:15:17.3560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+mI231cB77dK5FuC7I7VuqrPy+uP6Ug+hRk43ctdc4samBQjw9+AtrrNIuFJRAPaEOLT138fKRpLGNisrublt9e8kmPXynDXtPht5cWbio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1752
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08 July 2021 09:21, Primoz Fiser wrote:

> Proper machine resets via da9062/da9063 PMICs are very tricky as they
> require special i2c atomic transfers when interrupts are not available
> anymore. This is also a reason why both PMIC's restart handlers do not
> use regmap but instead opt for i2c_smbus_write_byte_data() which does
> i2c transfer in atomic manner. Under the hood, this function tries to
> obtain i2c bus lock with call to i2c_adapter_trylock_bus() which will
> return -EAGAIN (-11) if lock is not available.
>=20
> Since commit 982bb70517aef ("watchdog: reset last_hw_keepalive time at
> start") occasional restart handler failures with "Failed to shutdown
> (err =3D -11)" error messages were observed, indicating that some
> process is holding the i2c bus lock. Investigation into the matter
> uncovered that sometimes during reboot sequence watchdog ping is issued
> late into poweroff/reboot phase which did not happen before mentioned
> commit (usually the watchdog ping happened immediately as commit message
> suggests). As of now, when watchdog ping usually happens late into
> poweroff/reboot stage when interrupts are not available anymore, i2c bus
> lock cannot be released anymore and pending restart handler in turn
> fails.
>=20
> Thus, to prevent such late watchdog pings from happening ahead of
> pending machine restart and consequently locking up the i2c bus, check
> for system_state in watchdog ping handler and consequently do not send
> pings anymore in case system_state > SYSTEM_RUNNING.
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
