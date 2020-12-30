Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C880D2E76CF
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Dec 2020 08:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL3HS3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 30 Dec 2020 02:18:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:56373 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgL3HS3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 30 Dec 2020 02:18:29 -0500
IronPort-SDR: 5j1Q/GGttgJpMVEsyWu1tRbzXYh2FCFIraQERd+UC+PolQUIUtBV8Fl6rQ25dP6stPRjdvaSaE
 /I4x/mqXwraA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="261331158"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="261331158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 23:17:48 -0800
IronPort-SDR: Ti/ymPYAAeuyCSpTVixEonBue9GbIgRGIzzi37y8/OTl5Z1mv/cfXKkS4JM3wMJbxdRgPbaL1Z
 PONlhdSnDLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="419445409"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga001.jf.intel.com with ESMTP; 29 Dec 2020 23:17:48 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Dec 2020 23:17:48 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Dec 2020 23:17:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Dec 2020 23:17:47 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.57) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 29 Dec 2020 23:17:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGMSQeLj3ZYuu/d2MZQqgpefIb+21B/7w0ZdYrHo/7/FSgP4cGIkijF3aiLUX8QnJkeYsQ3KsLHKHS8g9Am1udvTHoEReBSdVWe+EOPv9eaK7MM8lup5PvTk6Wsx5HyhRpOLBY1g8Gia5nBGToyqYI+u8XjmZm0x6R/oMHdoK2vXdsak+UIvgZtMhxsjKbtVLuovPGYSAUYzJjzb44DJ+AEExPb1InKFtRBI9LeJjAq5BNoN+HgIXr3cYko8hVbAJsmcs9y3lIw0CPoaGByCyeGKLP0+L6lFptoytzLVt/ziYQRfUFi0IaY1UWMXA4+7IhpAP0PhOokZEioNiIAjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLHLQBbBABK+clEPCXL5N5JXjJSQ0VLsTUbE1RV6rnA=;
 b=VlmnHneziWfOibbshmvcx32Ntenjay7H2ws+LUjvzRAk8Ua3UOHQRGjPllzm2Bg7PbA4cBJcqz9u99VCBRMnMGS9bllakT1PDD9hB8PVc9xHkIZbXuy0BjI4TBf6Ch/slvLililITkEB80JNqv71gTbaM47h7S8MKWWZRs9YFXCYLireKS4afxy9Gpv5aLzF+Elizl5HDg9MLiadZE4J1JdFhhCHnF5pbzVNuhimEww98c2e3mp8p18OhyMemDud5/E0u/EzsUz8MwiDEX9fUDhNXWY9axISESfIEFaTplJxILMijxs87MQSPe5CWwU2A/+4LusNAe1BKZn+Wkgl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLHLQBbBABK+clEPCXL5N5JXjJSQ0VLsTUbE1RV6rnA=;
 b=UZ4h+lwJ+AyDsr8J3stPKUTOdSwHA6WUTHvvbIcv+cfzrDSAgHJXNwsmv0bgq49ABYXXMy47cEwS/zu+mhPJ9KlBLPka139zGvD/Y63xA5F2H3Nd8yxRvRa7b1qgyXRTydg1mKlMwg32M4Q/GRlCVVlECrSRO7uCG8y/QdSf0pg=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB2828.namprd11.prod.outlook.com (2603:10b6:5:c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.31; Wed, 30 Dec
 2020 07:17:45 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 07:17:45 +0000
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
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Seow, Chen Yong" <chen.yong.seow@intel.com>
Subject: RE: [PATCH v4 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Topic: [PATCH v4 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Index: AQHW09gGEECAwQGck0ygFmf5JftxTKoPTyXQ
Date:   Wed, 30 Dec 2020 07:17:45 +0000
Message-ID: <DM6PR11MB42500128E416A387353AE1C6FBD70@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
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
x-originating-ip: [42.106.177.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b82299cc-d304-4b93-289c-08d8ac93014e
x-ms-traffictypediagnostic: DM6PR11MB2828:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2828829D1AC602BD577B7D57FBD70@DM6PR11MB2828.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zv122ymw2VnN+UlksCW8D5ycQIw+fLDM3i3mck+Zj+/FYDDP1jxiNb+EIMj7MIPrzho+vIBPX/f1zPVXPzkN0W7qNxr2HOwqskEt/YhxldIBpBHYZnbIAKxm+mT7rfUd23qBnDh2sEb3Cwi8BrmJsCfKQE5T1ewg41zxSwyLJmRdMXAetHCBAoQM4Z8CkukCEjdCsUo0NO18oMWhJbqPi5AWtw7T6dYf8lRjYTP6R0AE5vmfULQAe88ilh+U0hOlR4byP96PsmjzMAoxQcWuR5dd9JDynwOaKTrqFaLj7bWdALW2oE8E2oyfI/VvjWK1HRsaTL1FljKUazYFjXOGo5XO+3SmC9XcyJL1uCo+EKi25K61IMncno9bNzza+MtsHOJRvLKmz/OPMrjgYh5pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(4326008)(8936002)(26005)(316002)(7696005)(55016002)(6506007)(83380400001)(52536014)(478600001)(5660300002)(71200400001)(33656002)(8676002)(2906002)(76116006)(66946007)(54906003)(9686003)(66556008)(64756008)(110136005)(86362001)(66476007)(186003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WrkMCl1c/zmLqjS6dgN4wNIwdiIWeezYIcjkDte2GGAKZhbhWst2jN8cU1qA?=
 =?us-ascii?Q?4aM7b7eAyu+4POGOOMTlBw4+nDfVXXIIIHCPL4gh4uxN6uEo0SRdFHrMbjsJ?=
 =?us-ascii?Q?i8iv8VeDHMpQpqXjsQfV7hneZNOB9BGbFTFNxVt7M9p6RAlv63RkTyd9mhhw?=
 =?us-ascii?Q?PZlTbT8Z6joygpTiuBch4MqQEI+Sc3BN1X4vaoTf8SUXZprEn/ZK/4MLerpn?=
 =?us-ascii?Q?/OYGcq6st9YI/+H0w+7UFhB9NB+99sdPZGUsBHuGJYRGPYMDuI9QLhuUhKWu?=
 =?us-ascii?Q?vTO9nhEE8vI3rqnSCIogPT/R1HWYFNXUSM9TxGcu7V5VIPU2173ZAYAYx86Q?=
 =?us-ascii?Q?Dithm9+IU8jNqztknGNmK7OMzOkqFoygwQIa9b8rW9WlDRzl6dEAeFR6DbEc?=
 =?us-ascii?Q?AkwIsdHOvsTNMAHpTgEAC2XtdCDi1tUQfzPh49wkgW+sY/QPJHwB4JmNZ2Ef?=
 =?us-ascii?Q?qgjQtTosadOnkoJ+uJuFTejarTSvADkiD6NP3O9LShJIR9rLhnqsfHIFsxOM?=
 =?us-ascii?Q?fzHy/UYsY10FOeOden0i7XBine9yLwzLpEi4gxg+rR4oDs0XFbdw8mMedATs?=
 =?us-ascii?Q?IKDZqXuEEo6pnnIUrZPudhiny+gxYHXh+qnh17/q5nGZ/7Ga9PrJ+0mIm8MO?=
 =?us-ascii?Q?CHXNjjTOpQmHruG1h1qnIJqirlxDiHeVfeYGmMuudGo2utcG7yUGUy1MtmP6?=
 =?us-ascii?Q?RETM6xMrPxUbZRKb/xdwl15/i2yKXlVozL6d20/IEL5dhaS59FQEK/O0S7Ct?=
 =?us-ascii?Q?A5261ijC3iK1RWENT0vcu9lVlKeZRWgXcBE9mNNxDxR0kEqHwRl9g5o117a1?=
 =?us-ascii?Q?3brlck6+IkiA6jkBiNAB7yZmOMs7zV9JHkOCTb/mItL59BMNLmjCtZVpQAtk?=
 =?us-ascii?Q?ygVBQhrrCxHxm9LSprruVh+OHWTRJRzp5GdZXUkBmjzCGL2J+AJ3wQxLw7wF?=
 =?us-ascii?Q?f7pNPThIx/zu06Ymb5PyvQa1tN5Tjff5C9H0x8AO0X0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82299cc-d304-4b93-289c-08d8ac93014e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 07:17:45.3855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgPW7RyqeO62dXS9eHbAHB7A8bYXSSHBB6JzG89820CPGSbCqQfEPOWoY5vo74y3RMAZMHYPOmQQ153FtDy51Pwsf9nlxhCUHNgc4MCiNBHn0vsYjUd7cj7FGfsIlE1u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2828
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,
Kindly help to review this updated(v4) patch set.

> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
>=20
> Hi,
>=20
> This patch set adds the watchdog timer driver support for Intel Keem Bay =
Soc.
>=20
> Patch 2 holds the driver and Patch 1 holds the Device Tree
> binding documentation.
>=20
> This driver was tested on the Keem Bay evaluation module board.
>=20
> Thank you,
> Vijay
>=20
> Changes since v3:
>  - Fix pretimeout clear, when user attempt in the below sequence.
> 	- set pretimeout
> 	- clear pretimeout
> 	- set timeout to some other value
>  - Cleanup the ping variable usage in the driver.
>  - Add keembay_wdt_set_timeout_reg function.
>  - Cleanup the keembay_wdt_th_isr function.
>  - Rebase the driver with 5.10-rc7 tag.
>=20
> Changes since v2:
>  - Remove reduntant write to TIM_WATCHDOG as per Guenter.
>  - Rebase the driver with 5.10-rc5 tag.
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
> Vijayakannan Ayyathurai (2):
>   dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
>   watchdog: Add watchdog driver for Intel Keembay Soc
>=20
>  .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
>  drivers/watchdog/Kconfig                      |  13 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/keembay_wdt.c                | 286 ++++++++++++++++++
>  4 files changed, 357 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
>  create mode 100644 drivers/watchdog/keembay_wdt.c
>=20
>=20
> base-commit: 0477e92881850d44910a7e94fc2c46f96faa131f
> prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
> prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
> prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
> prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
> --
> 2.17.1

Thanks,
Vijay
