Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40F42C977D
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 07:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgLAGTx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 01:19:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:20041 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgLAGTw (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 01:19:52 -0500
IronPort-SDR: rpN3G/5DZL9+Z/U8tqzTJLBDyZnMfzolCLLVL3l43c5Yj+a2m1OcS/6EubldZN7iufgZzEm9UQ
 1xsco7PlRpKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="257483678"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="257483678"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 22:19:11 -0800
IronPort-SDR: J3wD0kIokFkduCBdFdNwq4no6A2U0X/G8tO9E5a0JVBcJqJt6eBxjZ9+FoP2vm/c/PwLXi9vRE
 1vewbU7QR+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="334959693"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2020 22:19:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 22:19:10 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 22:19:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 22:19:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 22:19:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph0uvZusglfsMPRAEM+bVgMniQvhJ5m/+ZfZCobs9o3fdEkhIt2kHMAMB+fzSQdtzLq+7MnLJwKwW0HEakT4SlQzS5V/rTmo43E5kXjYcULcpH9uyrjxlW9G0Szzqq7u6xwXXMVfL0WVU7qKttFytCCPfKw86Hoyo3YWm48u8he59KqTA8U9qv44muDhQg7/ybedmGZn85xxk2hin302lrWBxNJJrInvtrG3dZ3GyYpLm6uu0UJl/89ft2pPjVQND96VyFrsmdOcU7y2phD+9kOxGGYaqCjv2FHBLiemsVtAlbi/6RXRISZGKxvOurgy1QAtSGeE/aKZgcGO2fG6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odn7ZTqC2OJVQO+G+AVhcwJzOPyEwa7oQFocE8xoK6Q=;
 b=Ei17VhtshNUMv/dq4zf5pw3udP4OjpMv5IoK9NvJ/aVL2XE8HjnfOljNdgWSQ2m/fx5/a+4W+WqeagUqChBJAWtvHWpOw2KxoslGG/GE7FJBW+JripN+gEaR8yOLN++mLfP4zMcHieFV90v/z66En/o1DiWXAsAVfwsm5HGJO3lQeAVZbVjKHV9DFcKFpuaVln0tFExddoF+AjFnlO0BlKYwo/ffHco7Mlxe81n/LbleXLobg2aslxlUPbQM65a8i/hP56qwCfqTOXqCoUDnA4oMtPbq8qfZ+TClmDd/rdI0PLgZWOZfpUjgBUrA0SapGonOvlCDJtpi08oCQVgAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odn7ZTqC2OJVQO+G+AVhcwJzOPyEwa7oQFocE8xoK6Q=;
 b=aJoSGQned/EsZ22il5xCWgBmS/63cez1Llqm5qHRL42ku29DBSxFQBKH73afRRofen9IxJmZsXUw5tFGZJ+eAYQTsr+lDbkKiM9WFoAdb47JkpMiVbTpyAB93rfZCZWBwHqiJ8B9o23lsn7MaZXbBUw273rIBp++IzRoBZ16qy4=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM5PR11MB1817.namprd11.prod.outlook.com (2603:10b6:3:10e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 06:19:09 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 06:19:09 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v2 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Topic: [PATCH v2 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Index: AQHWt4c5ZwJ1t/qEwUKjQl0U5XrjKKnhWtAAgACGFqA=
Date:   Tue, 1 Dec 2020 06:19:09 +0000
Message-ID: <DM6PR11MB4250802106A1795B78DF3C31FBF40@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <870c2fda29b290ee6b9f88b15bd1f173bfad8723.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <20201130220538.GA42581@roeck-us.net>
In-Reply-To: <20201130220538.GA42581@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.176.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf20d2b2-4eba-4de6-5da1-08d895c10382
x-ms-traffictypediagnostic: DM5PR11MB1817:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB181774D12FDACCADD7CF8FA0FBF40@DM5PR11MB1817.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zS3qNKMfNYjhCnKZIkcn1Ga1TLnUdb/g5agW3Fdki+wIyigp3y+Gxa49kxIlf7TAxPvYs8cD4BlEbrSQspTguZIX+GBCYpJ3cjkmomFsKoFWTLOKsxalRdpV2KV+ZCHdnHt8sqfsOYrvt9QiPFU44xiBFzoILobe0H7NHlj8zHFFVsNYkjH9xQpxPiK5lISOAlRAy4iO3YOH0pwlxN+IceZiSAOroYU93P+w94KhhOO//WInW3zQ1ppUU/IQKZx9wIdGrsKRjco7rFwkDH3d2R9G/MHA4OLBAeWzeB5fz0Tu+SwJMw5Il/GEZqQrRdFjx6PrkJJOLmc56bJVEJIAeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(4326008)(26005)(71200400001)(2906002)(52536014)(6916009)(8936002)(316002)(66476007)(8676002)(7696005)(66556008)(33656002)(64756008)(76116006)(6506007)(55016002)(186003)(5660300002)(66446008)(9686003)(478600001)(66946007)(86362001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: E46B6FOGU5rQqGUMrGBAt6E86OPEqGPz+pbNFABmm431+0u/9PWt1nFgw+CNL20L02uKkUoC37EKm+pLZj0qCAC5/H7hhN7zUEekf6nqAQS6n9XUWnGXDniQ+O83lnda1BN/3EdJrG9X4uOiXiEQm89RI/0z2l1VJ54hrnkbQLvdBPb8hNePlbmP3w0Xzc2sqHRANGFv+Ih6I0BTFHTfAxnzMhXdkKDgllgaWr8RnzpbUbE2Xip0Wttnpp7PDJvcundoLhmmmDKmU46rPcKm/iszmOQ6Jmxy2pyi6iHH/8uPAP/rFfvaeqtPUBL0Xh6PZFlQBVgcd5Yjra+xXGCKi9QC3+DqnR2SyBVCu0DUfJmNtOBSnoqToqbVpxjlThSNIT8mpTmXVJGnzBO9e5Ry6N4qN+K21DTnHkOXTAy9jvlrhyfEpPHNKnwY+SobH1Uf2oaCEglzf5RKVfq5JWDikWTq9S1IbDVRVcCUTykpsLFhZrbR1ypmR10wl9ny6qn2u1I7Qj8rww+utGdLBwfhqD4e54NHqEw7s+fVBN2lzLZ5J+lZacuADXsnply07ulwZNLQpzGG5pEVNrRLcbT96y4A2u1pgtOl2BZstUNIsab3vvtMI0ILzc0l3/qoHjnGI6Gk3/R6R3zFEffKq7dj4wAO1bbSar/bkNkwdXXWHG86g97d2xoZLcQJHx3HGEEsnBCBTkYQ9GNkQs9m7V9VkuTNUgH7ep/7KPDP0A+m1Zw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf20d2b2-4eba-4de6-5da1-08d895c10382
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 06:19:09.1408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmGN6YJ5wQ1F0fO2OlWWCrbjdnxKUEyJJKISzN3Q+qZ69fmN9eofNMF5E9jO5KDxfcnADrlZhNGx0ocf4KtlAJZnqLva0nl9TFatz4vKHCmALHCBeiCYK6e7kf6QDJ9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1817
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> From: Guenter Roeck <linux@roeck-us.net>
>=20
> On Wed, Nov 11, 2020 at 01:53:07AM +0800,
> vijayakannan.ayyathurai@intel.com wrote:
> > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> >
> > Intel Keembay Soc requires watchdog timer support.
> > Add watchdog driver to enable this.
> >
> > +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog,
> bool ping)
> > +{
> > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > +	u32 th_val =3D 0;
> > +
> > +	if (ping)
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> wdt->rate);
> > +
> > +	if (!ping && wdog->pretimeout) {
> > +		th_val =3D wdog->timeout - wdog->pretimeout;
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> * wdt->rate);
> > +	}
> > +
> > +	if (!ping)
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> wdt->rate);
>=20
> I am a bit at loss here. This seems unnecessarily complex. Why not just t=
he
> following ?
>=20

Sure. I can follow the below way.
Let me know if there is further comments to improve for the next version.

> 	if (!ping && wdog->pretimeout) {
> 		th_val =3D wdog->timeout - wdog->pretimeout;
> 		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> * wdt->rate);
> 	}
> 	keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt-
> >rate);
>=20
> Thanks,
> Guenter

Thanks,
Vijay
