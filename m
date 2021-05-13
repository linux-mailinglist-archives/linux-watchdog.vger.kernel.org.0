Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30C637F1C2
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 05:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhEMDug (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 23:50:36 -0400
Received: from mail-eopbgr30059.outbound.protection.outlook.com ([40.107.3.59]:22462
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230301AbhEMDuf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 23:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA5Fir1UrP1VLHpmcIR6Sfdbcq8osAocr0uwe74eOtcpOjehJBJwHP6fkU8+2dz3rSGCyFN+eZVpS9mL/H687qKXuAcYjh+bSCfNlsX2Sq7RYStJ/9XAtNkd8lZVjNrGutjanAxoCIWrpfNA9WwPfAA9N0TMnlcPd/5iopixZfhr7RZhLSOgXYcezKWpLQRRFQFTGqhgUg95qaNkJ2lXmSLnlQ3FfiHOo5gdPzpXiu/ItnZ1LlHOgsr5ZOJftiP7g8qaOtjDEEkDs0vKxbLli5JJ78QQ0KRIQtlU6u/iJtmJNTGZaoIuNheKECp4odaHbkWeTkzfQ3hooUkH3MeZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3dwxqGZSd/0X6zWGQ2cQ4XTcA8VzatuWZNaThnI9kI=;
 b=E8Vy3YiTL/iu9TnWyvS0PjWjf5Cn2wKBfF63ioRmsEuEErhu+ERk0aQuHhEgpimS1MIPlAqKoTO1J6ygyq0V2WuMIW2X8x7C/Ax9qAmeP6cDSmKOdYE4EFwV+H6CLxplcQYMpTqkWmd8ucE2092sxjdFu4CmtcF9QP1I9F2/KpHGTw0P8qVY0CiRR1wVvAzK5gF/AUiwqlPpTJKmQNfAprJgczbqSpbMu1hLvhxtBmniVYEsPe/HztkmZYX1X04NB8zcKpOW8DWcoCRr3QuZdHZJe1+5KPob2bihysex9LRswVeduw42x4MnSdWXfI9aXSyw7XDYUNuIMc5LqzBLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3dwxqGZSd/0X6zWGQ2cQ4XTcA8VzatuWZNaThnI9kI=;
 b=YgWxThHciiJyBg9tXlalhQzJ7iuMizHvmkP13mRye/Iou3+zqtQNuFFFq40bq9p2/OEoDqiATOTM6WKo1OxWz/anT27BKk4BFFmxCXDmf++bxEFSN5SCMoUrV7WX2u8Lp2GkjCzqDm53xdXQnmDeq6eY5j370styA3ywCOA7oZo=
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
 by VI1PR04MB6286.eurprd04.prod.outlook.com (2603:10a6:803:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 03:49:23 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::bcfe:215c:1b66:6011]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::bcfe:215c:1b66:6011%4]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 03:49:23 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
Thread-Topic: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
Thread-Index: AQHXRhJF8Us7ySGmV06kW0fPHW7nEqrdp+uAgAIKKQCAADQMgIAA4GQg
Date:   Thu, 13 May 2021 03:49:23 +0000
Message-ID: <VE1PR04MB6688A83899254F38221CE02A89519@VE1PR04MB6688.eurprd04.prod.outlook.com>
References: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
 <d5364293-8cba-0d39-aa45-a55c5d6d2af6@roeck-us.net>
 <VE1PR04MB66889A576AD92D4D789199D489529@VE1PR04MB6688.eurprd04.prod.outlook.com>
 <20210512141435.GL1333995@roeck-us.net>
In-Reply-To: <20210512141435.GL1333995@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb9ae2f4-c92c-4695-930a-08d915c218f6
x-ms-traffictypediagnostic: VI1PR04MB6286:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6286C9B75606411186AF489789519@VI1PR04MB6286.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5wv/58rwcWNc9pwbV1H0F2jVROB03u/Z3m3nEHj1ABlmDs/rNk82FTQwrNnU2lYHZxne86lXzyepXg3wor17AADUFziV9KzVRSKNPiExeJSH+K7Ar4DRChr71tddCE7CZUk+Hq7RWEUjbeUJN0gbMgg+Ba5TEMuayNkivdP6uUUL0PzTYbLkbkxiAqHZOU76T3SE4B7GeZW9/Xkutufb3yRc/HgNaCD6oV3mgJeDVg9deF2pvde9JrvNt+lnfXyLltA8lh5X0Zniiy9VS+oUju/94e5VOjPX70h+ROAB7TMDmrnafDM/cgGqwreTt0knBDRNpmeS1QrsCC5MDAfIffyU3ElO7AO82z1OMDafWVAEeFtzNOdpuCHV8MDrDXJwsVPK3Kfiigfrbh8uMZsx4UFAAo4FYYPKfDhLnTOZdZy8yUbuNgA/6rLbYX1VqlSRTtB/l9ewEy4EL71osBj1HV4cF7dZSzdV6NrqPRFqRIW3jymqM7D147TsWvltGYPJLIhO2Utgf+rcrkriRO90om2a+sWuURA93swvQRD8WkQyDvI1QmNv0RWH2rPcs50Ayp4599uOGijsW4vBmrjgCCuBO+nFrQGS633WZ2aMor0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(55016002)(76116006)(9686003)(83380400001)(478600001)(186003)(5660300002)(26005)(71200400001)(316002)(33656002)(8676002)(4326008)(6916009)(7696005)(2906002)(86362001)(8936002)(66476007)(66946007)(64756008)(38100700002)(66446008)(66556008)(122000001)(54906003)(52536014)(6506007)(15650500001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fYGvi3sFmCjb9QeCo1ATX34Z2nCYeWIuyWP87YP8R197oYy57yI93+bd9YLZ?=
 =?us-ascii?Q?H/sTJ1L7PGSCVo64enOU/buTbMWHbkE11To8umsYYMFfUjFGV0bMeVdP2zCC?=
 =?us-ascii?Q?yazHMyCRh2ztjO6ce+sNudz/Z7kE57D9hVNy7RPXhIOl8fYh5TSMkkK/1sb9?=
 =?us-ascii?Q?PfHj8q+damj9WyaytBTuPmsGMuoo2INyeX7RnzDbh3iiJFckiRgHMdUGCL/C?=
 =?us-ascii?Q?jpNKXzahARMHmNaFOWbLnxi2Z0ZBAkOA0ti16Oer6cbY7nQnxpjhFntm+UJU?=
 =?us-ascii?Q?2GxNMdh09VS4cNsevgzzQrxLZa1xSAWURr+h1nrlqdAUF9Ed7Rfp8+U02Zjo?=
 =?us-ascii?Q?YNzDAmDQXGnSFlweFhMdil6OQFhDpvmyhTm2qjC+YDFTcvWzqanCwXo30QOR?=
 =?us-ascii?Q?lKPggST6djcB4H938u0wESDB843Nzj7GzY1PypKYEWHgdCC6tnp8ET/wMnjA?=
 =?us-ascii?Q?YSb29gs6UDb99qoNRKwOJLOsobSZD4CP+5GRu3MsrrwU+b/jWbU8ngTpiO9T?=
 =?us-ascii?Q?LvCuH69TcCFQOIlwtZsN93KA1WSJp2Jjxn+SG03WqGqDwH44VPralm/FDjFh?=
 =?us-ascii?Q?jjMXi9N2H3kAg5IYw88BOcsafB8uIA0YfGQopcdKXT/5iSOexpLwv2lsqec+?=
 =?us-ascii?Q?bdqTytx3rvPGaITHCwsZH27ZC3U1yr6MbSoUwkOmlypnjAJ34Qa3gePdLigb?=
 =?us-ascii?Q?WMwcr89loDi2/XCUc2O6Z+3UmrVMN3b0IJ60Akz8tLzEDaBZwBi7zDyxRYTQ?=
 =?us-ascii?Q?f6FdC9l806rKtRAZy0xZgylPVfZEGpOjo+gX2hCQYsj+zzj/Q4dPwioCV4OL?=
 =?us-ascii?Q?sfIJmJORrexY8+RY+hQzsK9wuEfs+BQuh0WUnWN5iYGZ543ibMvcijMCJs0G?=
 =?us-ascii?Q?nIoH4VSk/kg+/Lu2UcaDUoHmMnovnenXEE5Vs1bzz9l9z+ucJBKakCz6Hefx?=
 =?us-ascii?Q?Det94qmbWntuNMD9ukTWJFP3+rzFUqlhmuK5gb5Vh1297A0CTrthDXiUPVOX?=
 =?us-ascii?Q?xWT5suVyRRzTmnQnt0pHyQ6s0Hca0u1O9MN1Oa51y0yJgj5uB5Ta9pdlA+OI?=
 =?us-ascii?Q?xOjc3ZMaRfQNV8fpC3C/yLlPYbVszqdidh/OwkFaOFlrohh8WS4wfmxdS5Ty?=
 =?us-ascii?Q?2i1SQVNVmfnaxHBEwsZbELwQ0Nq/njnNeb1H236eFKorr+DVveizeKft1tLa?=
 =?us-ascii?Q?pvPM0kUko1aQ/ulXbNw/4sSVLWrFlw0OjwSJR5tuSdXGJGLfqhbp55ArphCS?=
 =?us-ascii?Q?Jpg6IS7RUQ2jzXYmbm3Rk6Qq1VTlKvQqmwIRbNC5iCEu/DIlB0z74MGAVNuu?=
 =?us-ascii?Q?yOc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9ae2f4-c92c-4695-930a-08d915c218f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 03:49:23.4948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54wdolHl1iMAnM7Rln2obQcQ2pAPIWVQqU4kVtu7Tojmoo/X+WER56QBUT2WWAFCN5xBdLYseI6O4x7mQtwdmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6286
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/21 22:15 Guenter Roeck <groeck7@gmail.com> wrote:
> We can not assume that the situation is exactly the same for all drivers =
and
> use a core flag to indicate some driver specific state just to avoid a
> driver-internal flag.
>=20
> Either case, it looks like you are saying that the watchdog can be stoppe=
d after
> all, by disabling its clock.
>=20
> > BTW, for i.mx2_wdt which watchdog can't be stop unless kernel enter
> > into suspend, that seems like watchdog stop after suspend and clear
> > WDOG_HW_RUNNING makes sense?
> >
>=20
> Yes, if you make it official and add a stop function which disables the
> watchdog by stopping its clock. Then the driver should not set
> WDOG_HW_RUNNING in the first place, and use the normal mechanisms to
> start and stop the watchdog.
> That would include starting the clock in the start function, and stopping=
 it in
> the stop function.
>=20
Sorry, watchdog can't be stopped by disabling clock. The only way to stop w=
atchdog
is SOC enter Deep Sleep Mode(suspend) and stopped by HW,  so the suspend fl=
ow
looks like 'watchdog stop' which I though WDOG_HW_RUNNING makes sense.=20
Okay, I will use internal flag instead of WDOG_HW_RUNNING in v2, thanks.


