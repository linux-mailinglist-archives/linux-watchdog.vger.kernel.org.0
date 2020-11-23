Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7518C2BFF1E
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 05:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgKWErK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 23:47:10 -0500
Received: from mga04.intel.com ([192.55.52.120]:12573 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgKWErJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 23:47:09 -0500
IronPort-SDR: ZvyWIq7wQorRNPV2UOg2sbcq+036uXtbTw9uoStU3gOuuuNztccAewQY+jKJPjyggItA+z9zy4
 w5fXPIf/EqCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="169134956"
X-IronPort-AV: E=Sophos;i="5.78,361,1599548400"; 
   d="scan'208";a="169134956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2020 20:47:08 -0800
IronPort-SDR: iGa47MMPWcbcnUMggQS7i1FB1H8PpMdm9KgxceUUrxQZ9c7Ilauzf//YgOpFE4H0Qe0YpwYS5T
 pkrhL5hFzqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,361,1599548400"; 
   d="scan'208";a="534320697"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2020 20:47:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 22 Nov 2020 20:47:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 22 Nov 2020 20:47:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 22 Nov 2020 20:47:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 22 Nov 2020 20:47:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Adq7AnHhDzML0AG62x32yyTrMlpI++jiUZVvupHMnCd9ww2k1sO/pzWNHmkJ4gusKNdzQ5qlAHYXAhjctr6WnMWnMOXk2j8WmlSSpG1RNxuXVX/tQBUUua6xDJnd0xxCNAoPWsROnQ+UGW5GjaKJ0LDFZ1rj6eih84g8fXffPnOw4gXi3YzpUXK96wxztkGACdaTCxG94NE2ABcEWueVg2WX8yv3mW7VnQNzE/N1hf2IriAt81GnjSyDS2CRIWmfxF4G0HQIBVDSmxyQ7bUcrBhfRh823qqX1tBH7FVhN6UmOTmwS38ZTG6DimhnbYPAG3OGXriQaFXhTU0fCSOZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk5fixHaMOBTkYt/PUz5+/q9BwGLni7FknR9j/on80E=;
 b=UPDob6OG91FuCGinFF63iKZeUm6KD/UWP7T70wmqphWhmjHR4IlX2NN0NbR3GyEtz+HAOQkQIZQtrTqz3S0Fj2DLwSwDTdNPAu326Y0BSQUnnVKeCJKIEsm1FIuzDkcmEDLaMJs2kRViIpu0sXl/UZX4fhzxOGAxUI+sn+mm/Pgm2iUhmV7n8Vjz8uU3MksUHGHvuKgXHpo/rnE265ZqXPPwn+Ng506Ug2jEjm6wvTBDAkkx6QVy93IhCZ2+XQ9duo/BsmpudF45gus9lnF3NEDvHL9gP+k4P22NSvv5qHuoiIYnb8rXk2wY9KYpqhfcG2qpG/ryEEiCWI1L4Aq2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk5fixHaMOBTkYt/PUz5+/q9BwGLni7FknR9j/on80E=;
 b=ddA7XdkDpF4f9C7tLWc6Q4metBx9Og5cBiANPZQah1pWt+TYmlIf9N5QcDlcsVFgAc5BeJY0Fg36PCPHc+VcSEp/3tYzGAaSFdZbqkgnHe2d8DbIgCD+dtCfZgy9/adrPy82MChrynwdnb5Zk+gHuJv2+M8gOmw8d55CxtDqaKw=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 04:47:04 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 04:47:04 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v2 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Topic: [PATCH v2 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Index: AQHWt4dCrTcDbQGgr0KQBhakWFQqXanVNHSA
Date:   Mon, 23 Nov 2020 04:47:04 +0000
Message-ID: <DM6PR11MB42501B785C52DACB0B603CE2FBFC0@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux-watchdog.org; dkim=none (message not signed)
 header.d=none;linux-watchdog.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [42.111.147.56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b152c894-e6e5-4c55-cc14-08d88f6ad36c
x-ms-traffictypediagnostic: DM6PR11MB4531:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB453151D22E61B3D09EFEED4EFBFC0@DM6PR11MB4531.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXxh50sfEclZgx/LMUVs1LnWFfEroufs4qYMWX+ccI3Xz787ydpNUYwA/cKgw0yVgnUem6/ir1JqUWWlsyqtzlne7dQEwd6YqMaGJ7+mwAiZyBjhSeSmwENaD1wN6zBgYrvcFGOX5chxXn9hSe3/OJZRu+c3KzehvRnzSjyjwQI+/bJKAskuTO1qeE6HB3X1JMU+xm5RqAIdr1jOVgNNNx1+gxRGMqoPKwda/0bfADuY3CCAltqXfNne3O1NoWhcA6Sg+fJGTtmbLKmOVrUPuk0C4HSWUl6cFOX4dE5Yc2vLJK4ZCT8f/sBOZducfPGIaL/HUgTR2hhzPIQnqemfUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(7696005)(9686003)(54906003)(186003)(86362001)(26005)(4326008)(316002)(8936002)(8676002)(6506007)(53546011)(66446008)(478600001)(52536014)(71200400001)(110136005)(2906002)(33656002)(76116006)(55016002)(66476007)(66946007)(64756008)(5660300002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: PaI19G0yGe5lrn5RgJyHb3CxTX32C0U2RTGGJ9YuwOkaOOqBec3KmCXgNT4mf7LgF1F6+zpJAVEKMDx1xpBLdaw/EI5QhuObmB6alk/EkysrIUmjv4U9DUtnKb9VaGbWKApLVuemISUdS5+5AZoHgnGHEg4f8CGW2xidSC4pt+dsPE5XLkJizUbE1w9+ln5zxkmq6J3GcHefR1iLUDRN1zmUWVkEMCLJOAPfyA3d2pjAzWMZ6NtW8YTsFnhmqVksn9ARURLLkeR0n4a+krJODDNurNVBez8/tnkNV8wEA6t64sM/4A7xDiUNPEsKLyEIpm5OmULrRxgbwmHnroMMFnUH/7kXfly92eKP3/EqUrReawjzL1zV85ttEHzoq45xBhGZ7PxYW79Oqkl5wy4RKSH5misVl6zr8Ef3o9t+CY14pEqT1SxI+kHlHHp4X16HGQZCyCllCKeZaZcCF4KQcuyR3gUHLQS8j4sgr/JvORMBK+ZHKUeme7sWxQVhLEVSqarQCML5fQzNbWf9+7lfk2qngpUJ0/qS5xV+ghsE9EJXNb+Fp67/awlE9W220mh+dNZBk1dqDVcBnfnbQj6aQYCcX9JAMY7ltTUDSa+Ge/xSF3eGUt7k2/17rO0VQIM0RqqJfiShRKCLW8szXg8Mp5sgLcynumlWynkZ6kSNa2f0ttrY+4ExVQgKeYiofGWDW+7GQzjxz0mGUZmhpfHYpEKh+eRDz2IrgJ4tXCqr1laro6o67SbW1GrApSfeUTF4C/GiZJyt2wIPACPkVmymQRwFIzjCUra+Teq8qTi5T580XEfPhaJRFO0ljZv+2EE5WxM7Xf3wBCH4U/w4sDJJeC6Rr//+3DxUv6z2+KDCWHybjV3PONEl1zs4Hb9ERmZypiqvwDuISX0Uji5rymWd0Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b152c894-e6e5-4c55-cc14-08d88f6ad36c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 04:47:04.7944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkRn256t0X/uODq76CvHH9Kse5+ASDzSY3e8nQZjvrEUbTQWSwJjMDt88yW6A+Ck3oXngfrheKqbiLYYjTWSy0vWcONQx4d13BA4IRKWLbBqASITv8k4Z6IbGe61WrVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

> From: Ayyathurai, Vijayakannan <vijayakannan.ayyathurai@intel.com>
> Sent: Wednesday, 11 November, 2020 1:53 AM
> Subject: [PATCH v2 0/2] Add drivers for Intel Keem Bay SoC watchdog
>=20
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
>=20
> Hi,
>=20
> This patch set adds the watchdog timer driver support for Intel Keem Bay =
Soc.
>=20
> Patch 1 holds the driver and Patch 2 holds the Device Tree
> binding documentation.
>=20
> This driver was tested on the Keem Bay evaluation module board.
>=20
> Thank you,
> Vijay
>=20
> Changes since v1:
>  - Fix indentation error in the dt-bindings file.
>  - Use true/false in the second arg of keembay_wdt_set_timeout_reg().
>  - Fix the watchdog start sequence.
>  - Avoid reduntant timeout register setting.
>  - Remove min usage to find actual time at keembay_wdt_set_timeout().
>  - Remove timeout configuration boundary check at
>    keembay_wdt_set_pretimeout().
>  - Use devm_watchdog_register_device() for wdt registration, which
>    eventually supports driver unload functionality as well.
>=20

Please consider review this patch and let me know=20
if there is further feedback.

> Vijayakannan Ayyathurai (2):
>   watchdog: Add watchdog driver for Intel Keembay Soc
>   dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
>=20
>  .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
>  drivers/watchdog/Kconfig                      |  13 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/keembay_wdt.c                | 288 ++++++++++++++++++
>  4 files changed, 359 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
>  create mode 100644 drivers/watchdog/keembay_wdt.c
>=20
>=20
> base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
> --
> 2.17.1

Thanks,
Vijay
