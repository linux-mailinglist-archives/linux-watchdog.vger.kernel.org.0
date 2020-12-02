Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FBF2CC022
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 15:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgLBO4Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 09:56:16 -0500
Received: from mga01.intel.com ([192.55.52.88]:51961 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbgLBO4P (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 09:56:15 -0500
IronPort-SDR: XFDG1P/W5Pbb0O5QkAzwuWqRe8tgu4mWYuGVQYVRAyhY/BWEFzZcyF9bFOczGMfWPWurd1C6d/
 dVJff2fxrxsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="191242094"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="191242094"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 06:55:35 -0800
IronPort-SDR: +jhjLdby0EkBzqRghyl4hu3/FI+UKqRi1+MMgJpBfb+xbBP9uS3AHTeY2jHKVQ8eFOZicj1CUC
 gfgCH/kwV4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="539722887"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga005.fm.intel.com with ESMTP; 02 Dec 2020 06:55:35 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 06:55:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 06:55:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 06:55:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 06:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3kwb0Ls4/WfI4HPihNaw/KvdbZcfJ4Bn1jqsRInZzmve5IqW3rxARFe2D1Qk6n4saEn7FtlEjEbItj5fXXp6hRVX/UoJtdenCoIBEUs8mEiRy09vZVBpuGF2twY8aZ7wcgPU0QxPKmX1exBzpij7dt4LLYcO+EuDqIFte8iLkYDfHUeMwIweuUNu6GUfK84v1RA5CB7AaRrETe/jBIAOXxm+ok//ygwVy68xzQCL7L2nBKhiUfRp/fKVX3HHAdyrNFwo2draRd4ApbG2Aa6wlKzWfqAHVlzXBrTWIXbg9drxSp816NlDAtQ3DPo6OYqXccE1lwIb2nDsWRZlomYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKm4wUoB1rVhmWECEWk9N+aFvB69L9rqgwBb8PRmfQ0=;
 b=D5V/Lau+pcoLpkC5oc9AaLeKe2bVHkaVqgFnvtWtmcHpjPJji8t9yC+45z3xRfzxki26Kof5Z2PZcvDAGEcJWA5eF8fnP2J1i3iEnDYs1Vg9BWeQewoKSWyYTwQ/xojqz+7mjKTnc22aESGfnTe6lL1YV7kOqDmBwAVrnwIQxPj+V0y1/DmTHkVGa5Rr0zvYh4LaLdULV87qEQfJDFvXI1YJbJNMKPohoIgKZep0fOyp9IfHD09YVtDCOtX6WWaq2hDPPidMRaDnn/pk3wZ7IlpUljJflZ0SiEclKhNSdqk/h4emLowYALxDLseE3yuf5Nf7KGCM3kVBRLjLW2EydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKm4wUoB1rVhmWECEWk9N+aFvB69L9rqgwBb8PRmfQ0=;
 b=XchPrfrbZALolrglVnQbmE9IeRzGk49XFmSsxRx9TroBRCtzgD03y3z+pgOQY3PsZFzeAjVa9CcfpOyz37zA8ZYVUGOm942NfKnEO/pysJ1+XEQyVr0fTTtbaDQIieWMxGhi/bKJEIw4QWJMANb4+HR/DHzaNh5UP5UE7RMtlYk=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM5PR11MB1449.namprd11.prod.outlook.com (2603:10b6:4:8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Wed, 2 Dec 2020 14:55:32 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 14:55:32 +0000
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
Thread-Index: AQHWx/CMDVzq6Upyk0GVGIKivB/BZanibsAAgAFtX+A=
Date:   Wed, 2 Dec 2020 14:55:32 +0000
Message-ID: <DM6PR11MB425005AF05352338BE5403BEFBF30@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <e941999cb6ccd19d1830b3205ec3a66081ed29fd.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <20201201163044.GA89174@roeck-us.net>
In-Reply-To: <20201201163044.GA89174@roeck-us.net>
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
x-ms-office365-filtering-correlation-id: c3b26705-f8d7-4682-5147-08d896d25171
x-ms-traffictypediagnostic: DM5PR11MB1449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1449CEEA6358A06459C6946CFBF30@DM5PR11MB1449.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1BORsZYL5MkQtT6KCgrB4T8I4u1vOlC2EN2mlz9YonEsjyddh1VEU2xPkGj2/SLM3eVrE1xeUK2RzorYgzl67uZ3y+9hjOaRj+m/vPBRYzwBpJL9/6yWY/xhIKI0t4TsWsOiiHt3m/7Gc0WeOMLdPisak6eT9LAdiAWOtkZRDyoGNmT1h+zPPROXFuioo7icbgf6FRNqyzarQN2qaj9+v0NIlWWDJi0KR7gFvAepakBuf0LBFBnU2lK+qmBAAQ3qACuCt0Gi1z2aVngdAid3Y6aXAd1Hqf07eef0/wvjI5AgS+s9YCHrrYJZfTuqLYUnL3Ol4y0yTqnXMegC69qakw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(316002)(2906002)(71200400001)(6506007)(26005)(76116006)(86362001)(186003)(54906003)(33656002)(6916009)(8936002)(4326008)(7696005)(52536014)(8676002)(9686003)(64756008)(55016002)(66446008)(66476007)(66946007)(66556008)(478600001)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zJjfk4dR4vAiS36cOPuu0A590Z89vroNAIEf/hudPL0vO9Jj4ubbkExpnQ3u?=
 =?us-ascii?Q?XCX6mRpnXxTA40JLwui1FROm3SNZC12sFnxyaUFbVjCK8WlUs4ZS8S3RnGiT?=
 =?us-ascii?Q?aob7SH7R5mQjOvTw49G0qHmG7z9IHt/VQuvpskQmNNCds0+MghpA2qOmJBZe?=
 =?us-ascii?Q?fSZKd6XwmSIROv4EbXLWxPTpDVgPjWmqOkh6RYeU8iGxaj8lyGyGlPD0aDet?=
 =?us-ascii?Q?C8cjf6EEwzlBKNVKHgj17XXNuzzU+m//mipeozqMMFrjyNIxVsIS8a01yFo4?=
 =?us-ascii?Q?U9+AlHxyUyuKydgrU9Ch6dvVGFQVhvlAXZrm5WKwc34hZMDo8bQNE5pwzpzM?=
 =?us-ascii?Q?aCk30xJluRx8ydgxtbj6TY2kE2rOBt6ZBdsUNkm/RnEERTt/8AXKpuM1voIS?=
 =?us-ascii?Q?8XIko8lQyxelTIeMpNzB44F1Mufk6MCzJ7opUumS+teG7sRYacTIKYko41UJ?=
 =?us-ascii?Q?muDQWGkjfEVSqatEU1UeeO3JrDtKXTWTbi5riojyP9SZhGMSQOy3YItrFRqC?=
 =?us-ascii?Q?Bsj3CE0Izy09LRGODVvhXjFZObPgjemFLHTjfE4RAP8PztobC+WBV1RgfdXz?=
 =?us-ascii?Q?ocCd66wOMyGZDK0SEvaDedhaCcltZPibsoVtf3+UxPLhXGP/PU1NJFd5wZf9?=
 =?us-ascii?Q?WwV0RVJ2hB9FMK0+uO8k5nYwZrrHZYojEfNT7CF3WvEOjRfKKM4KzaKLXUdm?=
 =?us-ascii?Q?EaplJg0c07qtVD6yt5I+o+WyvYiwKK9PeFvY1zn7sia0rVVd4YCyNVdF0XzK?=
 =?us-ascii?Q?XXgaQpxGQNSwwxoch2m+m58lDYluJ3FlUMfwJnK65cj2DtYJO9oPSEBVUb7K?=
 =?us-ascii?Q?O2WcUPzUiVjwjignBmRdEFIeyWXcPFnhR7ZkNgyEVx6NJdVPHRhc5tFL3laq?=
 =?us-ascii?Q?s6Nw48JS9GWXQ26ToX7u6IwLZh0IzLpI2E4XIsoMvmTAye9HPDlYQJIk7kuf?=
 =?us-ascii?Q?T27brzkMUQAwJXpus+LVBnDflyOi3h1JwAGCYJC016M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b26705-f8d7-4682-5147-08d896d25171
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 14:55:32.5425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClYFGUlf8C+WfPZSGxuJod56gZF6odNeQ2s4XVarnaWS0cWeOEfS/QbWFosQga4B2q296w2O+EDWwf1sObF4yDzdR3lHS/CGKK1fpScJNGk4me3PwXi5R5WFe4HvlXSv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1449
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> From: Guenter Roeck <linux@roeck-us.net>
> Sent: Wednesday, 2 December, 2020 12:31 AM
>=20
> On Tue, Dec 01, 2020 at 11:10:33PM +0800,
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
> > +	if (!ping && wdog->pretimeout) {
> > +		th_val =3D wdog->timeout - wdog->pretimeout;
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val
> * wdt->rate);
>=20
> Sorry for annoying you now, but I may have found another potential proble=
m.
>=20
> What happens if the user sets a pretimeout, then removes it ?
> What should TIM_WATCHDOG_INT_THRES be set to in that case ?
> Right now TIM_WATCHDOG_INT_THRES won't be updated anymore

It is a good catch. Indeed, I don't have coverage like this.

> in that case, which seems wrong. This might get worse with
> the following sequence.
>=20
> - set pretimeout
> - clear pretimeout
> - set timeout to some other value
>=20

Can the below method resolve this issue?


static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32 t)
{
        struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);

        if(!t)
                keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, 0);

        wdog->pretimeout =3D t;
        keembay_wdt_set_timeout_reg(wdog, false);

        return 0;
}

> Thanks,
> Guenter
>=20

Thanks,
Vijay
