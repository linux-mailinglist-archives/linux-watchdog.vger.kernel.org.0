Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777752CC32A
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 18:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbgLBRN2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 12:13:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:27364 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387462AbgLBRN1 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 12:13:27 -0500
IronPort-SDR: AJuIq43E+jT1cTWBnwY8SJqxdFbS7OAeUMe60XWXmA+mfPM5i41IEUXYHPXjjUinUJMnb7Llrd
 wXQo9FenfAtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="160110177"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="160110177"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 09:12:46 -0800
IronPort-SDR: GndWUpWwSGW2ltNjKeEJff3qez0ItBKCIMlMNZ3jPX0YqZfkXDuoXGlpe8r8V9Q6FqFuKPGHf+
 UQPzMa68UCpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="435122475"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2020 09:12:45 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 09:12:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 09:12:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 09:12:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 09:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apLk1+6J3Jw89ZoXWAlrFWdSP9w24o7ZmXLmerHd0XBuMyMdaMCIZ5lEeA6uwZCE3C7pbDuzeSOfKDLQzQH9DpwYaKS5hJDVVf7aZ8WMvi8wFLESYTKPfTtoJMtmLIWaxkqijSfVGrOneBM7oMvqVnCB83PfFSloCI+jriPsD2FUn+gtoGVUN/54gOYeO57QmW9TyrgfQ05VZXxAmju4yG1JOQBAB53voLOS61mWHgx3HgUJBThH1rtpSnM3cy/bwviz74vg1JYVI3XTt9snQ8lYqrUJvQx5m5bDt88Gh3bHXPVn0I/FGOSbhtQu2auziU/BZESPf/FkBL8sOzWCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEYWvqZX5NzHITfq0peiBiYoDJ63gUIYejj6iQexeU0=;
 b=ZL0tIet7AOFlRMjj77YIN+xtyoUAiK2VRmhUmwDN4W8klwY91blMGCMv/aOhPEPMPg94qYlBZ28Tue+VtaD8nqgyCGjDeatYELXyMZzLer8uZCsCU0/i9OvRryQ9dagyXABV89IrUzw4hhrEcMKquJf9fzYS8oo/pf4mivd+TPTmGmxxrBztYYm5GaGCTOnarPkvZLx4PHgBnEjOVJNx1bvYEoZJDzaNMPYVrcko/KnLWYhdeXeZwRo90xMYTA591dOPYe1KMjBYxjsHL7wym399Lga3ek3XloKOHaAY1hpmIGdCXNKuGhYRvkXDnnGlLRregbXlUngdjhLwX4YwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEYWvqZX5NzHITfq0peiBiYoDJ63gUIYejj6iQexeU0=;
 b=dS562VKoKeeBcToE8vh7oamYNFl0JP1thiEYZ9QsHnyFce6k+bpAu9RjgrdkwqOjhEY/NX/W50QDMenYCkbZmJnvzvv7LX8l3Eu+5E8YtSLR8GorQiqTURv5MTYN/5KdXtKymFKgJhyc14Okj2NybRnM7gcvb6q0J3I2JtI5gnI=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB3579.namprd11.prod.outlook.com (2603:10b6:5:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 17:12:43 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 17:12:43 +0000
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
Subject: RE: [PATCH v3 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Topic: [PATCH v3 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Index: AQHWx/CMDVzq6Upyk0GVGIKivB/BZanibsAAgAFtX+CAACV+AIAACNCw
Date:   Wed, 2 Dec 2020 17:12:43 +0000
Message-ID: <DM6PR11MB42508F9E0FACB158A392D322FBF30@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <e941999cb6ccd19d1830b3205ec3a66081ed29fd.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <20201201163044.GA89174@roeck-us.net>
 <DM6PR11MB425005AF05352338BE5403BEFBF30@DM6PR11MB4250.namprd11.prod.outlook.com>
 <20201202163238.GA215023@roeck-us.net>
In-Reply-To: <20201202163238.GA215023@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.176.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6661c78-3aef-4468-275c-08d896e57b80
x-ms-traffictypediagnostic: DM6PR11MB3579:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3579779D65E349EBB37F06A3FBF30@DM6PR11MB3579.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VBeQxwfK5uxVnaBnAKtlmNnoLdQjH7BUshzc+crPztQyvyW0SthcqbKatFMXhiOXbhv+IuAn/E5OFkpl/5kTQLR8ZNoBgJSRamKyRInkChXdhgymeNh4MHmzqZO/TYfEgcZ9/z3/dvTIlpHLqcywmCCd0yGVeFXBRJLFxk3YU4UCAHiv4NgPkfTcyMgpbJctA/ffpVHKdn3qjAo41qWn4bRnA0c6iVJbRayY9/VqtweRGVADwZN86AmsUe7H/JS8GgUAvlVTdDh7Yif8VFaGVGJfDuRnq1qFt7jFH5kM5LgbyTtsyHa/OgyGx97izgXdg4VI478wcc92LXPIziS9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(8676002)(83380400001)(2906002)(9686003)(55016002)(76116006)(64756008)(52536014)(8936002)(6916009)(86362001)(66946007)(66476007)(66446008)(66556008)(71200400001)(33656002)(186003)(54906003)(4326008)(7696005)(26005)(6506007)(478600001)(5660300002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?npqNjDGBwVuvEsjljzdUFw1voYWZ4uJ59Zk3+Epqy/UujRzXtOa6xnZtOrKL?=
 =?us-ascii?Q?ULXvsYSs/txZwWWeTphDekVBXXICJpWQlTS4hzZW3aINVSx4DajGh1JgaYYV?=
 =?us-ascii?Q?dgB2OSvFWvteghsCShmugPsd0VhWaM1AK0OaKQoOX5+DsxCfG2EFOS3Z54pg?=
 =?us-ascii?Q?kxJp9INgXerPlD2GpPdpZTkN6GbtaXgKyRoOn86PrHJ/Kj87XljNVIBeTvGf?=
 =?us-ascii?Q?IQxX28gpZPp1SMW/TAmjLgj8GjVyZm2XVcZqDoFRbxALgmt2OiFXes4Xxazc?=
 =?us-ascii?Q?nEyW07dDKdVi1jn62KJAmLLT66KZpQvYpfd3WWd09VLA14h9lY0vAzSPKVSA?=
 =?us-ascii?Q?0g/cUinCki2mOwAsWt14mi207hkN/Ync9xxtDr3tqinX/V3zJIKquBOkDDw0?=
 =?us-ascii?Q?lDjbRe0qmwE3LWm2mt2c4Ke+iaDrMRfjWxELnxkpFwljxrTuh8u0dOcHHg+g?=
 =?us-ascii?Q?RPC8HKYhe4s1qMYEQqJAjkUgWhZatpyIhHJtOPVSTiy8ZOjJXkNh6qH5YaZw?=
 =?us-ascii?Q?dvXzs241+a5je0aj3yCYS66N8RkTXdIPLEe9bn2ksJKF7BBrQNS/d3sRUYaW?=
 =?us-ascii?Q?x+20ckUqjlcV9et9HAUc/iKIRyN8P692kkU+7FMQ3EsJ48QwP0wjcPQUqu3Q?=
 =?us-ascii?Q?2zy0LVyX+wq+aY+PYPMZtwdiqFLcc64up71ME+c5S+rtvCgkKlSgNVOAaNz4?=
 =?us-ascii?Q?7r27SAaY9S9kB01Be8wDBpug2spZ5H87gTm6Z1IfjfU8+TQMyXqMoNSsgF1H?=
 =?us-ascii?Q?CoOE1oYJ7LBbDC5zFnw+DZCqD+nXu4eGvh6qFyldJILv9xX7N1cvvCgHBAIf?=
 =?us-ascii?Q?gOcr2G7YpRLHi87Ubt3aZqmsE3y/M6Lh8yF2TOwivbO5Rou+f5wDLF8l+F/w?=
 =?us-ascii?Q?jPtDkqjhqjFRp8dxlmDeBMI7GG5sNcxeOg8v22kYli8O3hf1O3M42fAJYNGu?=
 =?us-ascii?Q?ExJjsI8Tm3z82cvbu6Sp6uEKUgGce91YWZZvbw/92GU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6661c78-3aef-4468-275c-08d896e57b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 17:12:43.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1cZgEg9+cTAXd1vBpZ6cX4d1Zg+MxDU8sI0SJOUdmdsrooeUo2emjQ4jxOt+H56gmBRPoFEEkbx3sqaWvn+YzV/NzsvqeES9ZlGLuj1JPjpR6tZfm32fds647HFbvz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3579
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> From: Guenter Roeck <linux@roeck-us.net>
>=20
> On Wed, Dec 02, 2020 at 02:55:32PM +0000, Ayyathurai, Vijayakannan wrote:
> >
> > > From: Guenter Roeck <linux@roeck-us.net>
> > > Sent: Wednesday, 2 December, 2020 12:31 AM
> > >
> > > On Tue, Dec 01, 2020 at 11:10:33PM +0800,
> > > > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> > > >
> > > >
> > > > +static void keembay_wdt_set_timeout_reg(struct watchdog_device
> *wdog,
> > > bool ping)
> > > > +{
> > > > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > > > +	u32 th_val =3D 0;
> > > > +
> > > > +	if (!ping && wdog->pretimeout) {
> > > > +		th_val =3D wdog->timeout - wdog->pretimeout;
> > > > +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> > > * wdt->rate);
> > >
> > > Sorry for annoying you now, but I may have found another potential
> problem.
> > >
> > > What happens if the user sets a pretimeout, then removes it ?
> > > What should TIM_WATCHDOG_INT_THRES be set to in that case ?
> > > Right now TIM_WATCHDOG_INT_THRES won't be updated anymore
> >
> > It is a good catch. Indeed, I don't have coverage like this.
> >
> > > in that case, which seems wrong. This might get worse with
> > > the following sequence.
> > >
> > > - set pretimeout
> > > - clear pretimeout
> > > - set timeout to some other value
> > >
> >
> > Can the below method resolve this issue?
> >
> >
> > static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32
> t)
> > {
> >         struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> >
> >         if(!t)
> >                 keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, 0);
> >
>=20
> Partially, only it makes for awkward code. After all, it is never really
> necessary to set the timeout register after updating the pretimeout.
> The "ping" parameter makes less and less sense with this in mind.

Yes.

> It might be better to split the set_timeout_reg function into
> set_timeout_reg and set_pretimeout_reg and call those functions as needed
> (and handle the if() above in the set_pretimeout_reg function).
>=20

Ok. Thanks for your suggestion.
Let me incorporate necessary changes in the next version.

> Thanks,
> Guenter
>

Thanks,
Vijay
