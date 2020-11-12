Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4492AFE92
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Nov 2020 06:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgKLFjM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Nov 2020 00:39:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:64772 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728073AbgKLDKK (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 22:10:10 -0500
IronPort-SDR: Bmkp1vqnBqP/HtiMSfXNi7YdzIAt9utFpNAN41xK89ssPp8HwUT50pFKxXqbI2j2sxDW91ap7s
 WRJaAda+Y1ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="169466865"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="169466865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 19:10:10 -0800
IronPort-SDR: b8YHAGBphtIL3c2K5d8Z4dxxq5qiwu13MCR/R/p2Kbfgk5qEh9u6/soDZO21XSbmxThfp5P0iK
 S4HVrCDNJDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="531954468"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2020 19:10:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Nov 2020 19:10:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Nov 2020 19:10:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Nov 2020 19:10:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 11 Nov 2020 19:10:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmer8CmY2NvwWAWE+QXUdKkIQsOEfl5OIYRpCbD1ITa8VrBCUA2yIDGhlk3uVdinQ7le5oapOLsHSWvpGh+KjAAXLUCH4p8UfBWrtOR3UY0lBKXH3Rqsp/CjOl8rWgHh0TziF/M/aTgsYlvy8wshLPOTFXb2hqu6XC2V07DBbF0HbVy92eSI4DWm7W5egsl3SrA5VUt2RklIjxptSQSF22J1lVzt7ZEpqlKlilX+iWfNIRI48WSe7Zj1ll3losuTM/q1YjTUYFZn7GMRFNKcgxLuKgHmqplaE0THXCPoaXiRmOj2jxsIsHSvNFiSDB55UFSaoHaw4//aJHgKYwh1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNc0MtVW1XRSVH5wRR16frvJfVLOt2AN623lU9qZMqA=;
 b=QWlO6JeHbKq5USyHzdGrVpbRZsavpLBZmreM4EnkRgEm19x8WNem12bBiF5Zqufru8k3ByUOcJ4Yb74gd6V0JkuZ6vt6vgnqGv4Vfsp05tpD2lZRNxQaqsmrNPmt+wEdt5B5cNcge4H/0L/f7NHO4MWmjVvZRQrPn/VfxIj8uRgLD+NSPTfA/pFcX0bxuOmRu6sFqPnuXnjhZ9W/cWUs0XyRejdaSzdUeMDUF5tJRAepW7A+CZ4+cm7qznd7B9RscLqI57mFW1KaqI0Ay18hA06PxduOTb0SgRn4gDsQbdAk5lsAMa1ukLIB9rLBzXE4xin5gOxyNqh0RJcIUKNMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNc0MtVW1XRSVH5wRR16frvJfVLOt2AN623lU9qZMqA=;
 b=B+ovPnYn4FY2kcphXF9CsQAEJ2nzWxplQyFEobgCA/y/49i8bFb1nlMbcQWsLzRoigkwrkWbafHv9/lFCR+qVW1JInG73KGyxvU/jSWqJHDIw9vtvoZzYuRVW0ps25mHbuUw7cGxwp2mbAoi+GwR0snq2Bz2w0Yj51T9GPzkt+I=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB4187.namprd11.prod.outlook.com (2603:10b6:5:19e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 03:10:00 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:10:00 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Rob Herring <robh@kernel.org>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v2 2/2] dt-bindings: watchdog: Add bindings for Intel Keem
 Bay SoC
Thread-Topic: [PATCH v2 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Thread-Index: AQHWt4dDfnLNvk2baUG8CdSXeJy8X6nDXIMAgAB14RA=
Date:   Thu, 12 Nov 2020 03:10:00 +0000
Message-ID: <DM6PR11MB42500BB69009125B86C2115FFBE70@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <e5b874280fded0a90f7a94b03ab1bbbae4a72ac6.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <20201111200356.GA1934066@bogus>
In-Reply-To: <20201111200356.GA1934066@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.177.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00e82afa-a5bc-4b42-6e6b-08d886b87128
x-ms-traffictypediagnostic: DM6PR11MB4187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4187FAB57048D30D08F73E21FBE70@DM6PR11MB4187.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ump5a/UrIgZIlVaoV1FeYwmJi9MciTeaXHuupjO0RML/WarGoxFqfjy7edoZ5d5YMPvArJtHTScO5s2R9IrGdIsKQSXeBOJYJkrLmK5MqaBKmT9FQqJDVPUMgfftnbusAi1+3C0dx2tojEIcKT7RHVVvG4jLmxME9Taf8MRvohEkojLQ+ASdGo/EX66Zk+bZORS+Uo8C9GdvEow5mjHN8afc4tRg2otYmjBy8VZhB3p+qb8BRkelB7SpV3RmC40jNW1gEMV++B9yF/LPJoFqr56jYAeCb+KFQr3pD1+8zZCdlhrR/F8Eg00mDK5s1Q5SZArzrUooDVGEvJMwJoyVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(186003)(66476007)(8936002)(316002)(66556008)(64756008)(9686003)(33656002)(8676002)(76116006)(66946007)(66446008)(478600001)(26005)(55016002)(6916009)(52536014)(54906003)(2906002)(7696005)(86362001)(53546011)(4744005)(4326008)(71200400001)(5660300002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: JwbnVrSUibOfOjCy+KnCyb8J03cGJ8aW7toFMACPeHbgSw7lUMdxp5vPpWOVZvo6+ORQEAofvB0OWYGUBYB1H2m1tLaPf9Dsf1/BRK+JYQHftsFzNa3/EO2srQq65eCgl3TwfVbuhFzea6J8BOxMaE79ozC0AQwuQGTUZtVw9B9FGDpieI4BJGSnkfQ6T4NGGIyACNGcwqbzhgAT00VrFKLluuWJKtvQsy5kv4pxAASTTpXjDD/5OZ7H3QwcJ7yp95BPnMZ2l0NglFN+4geSDCqrQbQght4Ycd3uPtVK7AlD+UQzy6ZG9zzeknURzH62xjw3zHjzHq+Unnlh9oeY1grfg7V9MiEY3GweTKleozy7R9EB+5GUE5EeKjNkH6dHqbKpOuqPnW9mhdygAX+9mYkKPgf+o50jhOfWmQK5V5/DlmsmK+2tZV1LFDFvAm7MWOhEnqpydKmcxF+LjfOV7ZmUbIJ/dxpULWD6DBxZze/rVZoHvGrBzX/t+14pqve/0RlgzRUHk8J9D2007dE6qT7JgkArwffDeYyjP5O6eJJ4ZkHytdxgL/WNW2kJVF3HGsKg9mg+u2Oia+JliP6Lys0fD119Vn8KL0wrBA+jPr15tdQ7BWq4DDbq2Q8csW1nzib3F1SJG6kGuflJO10CtA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e82afa-a5bc-4b42-6e6b-08d886b87128
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 03:10:00.2675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4nWpV00rhxrXMX0OgriAyty/yElEo7XyS0vhtQa5iNvD29KEAd7tt/dvv/5tTrWwt7q7y171rwZaaEOC3GgKEB2rv4DDarjQnt+mcKqS6k/6Lcd17VD46RbZnCgdvFY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4187
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,
Thanks for reviewing this patch.

> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, 12 November, 2020 4:04 AM
> Subject: Re: [PATCH v2 2/2] dt-bindings: watchdog: Add bindings for Intel
> Keem Bay SoC
>=20
> On Wed, 11 Nov 2020 01:53:08 +0800, vijayakannan.ayyathurai@intel.com
> wrote:
> > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> >
> > Add Device Tree binding document for Watchdog IP in the Intel Keem Bay
> SoC.
> >
> > Signed-off-by: Vijayakannan Ayyathurai
> <vijayakannan.ayyathurai@intel.com>
> > Acked-by: Mark Gross <mgross@linux.intel.com>
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  .../bindings/watchdog/intel,keembay-wdt.yaml  | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> >
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Vijay
