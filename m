Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD22A37F29E
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 07:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhEMFek (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 01:34:40 -0400
Received: from mga12.intel.com ([192.55.52.136]:17975 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhEMFej (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 01:34:39 -0400
IronPort-SDR: NBZ5/u7jWxLA6pW1l/DLoX3+yX69ziypWDgKzdArbKiKIIY+XA/QcjHQlAghBnp9K/UQvuTYUg
 WN+6yQpjl6Iw==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="179468571"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="179468571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 22:33:21 -0700
IronPort-SDR: J6wtmjfpvFcBQ8ffSpWmY0kBkEEfKHG1arOp0eX8VFPzqFyabinaQ4isTFFiMIjtroX0lZqSGL
 GoXge5W1GMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="392154189"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2021 22:33:20 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 22:33:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 12 May 2021 22:33:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 12 May 2021 22:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP7F6yBztl6+I+HAyDe1+F0nR+HnrGNFZiWgyxoNGHCkajSRSj944OkuqIykO3Av15QkCdcPQZ9Pv1ZnSJ8f7WeAs8jYoQWFLCJ7FvhZBC1EidtCXAk5kMApAnqLj64TqnN+m/dzxJGzeOcUI0tNpIadwkwQDKvDsdp6P1sAomq9WZBPotdP0t5zVjpMS9AUIHl62Svlok0wdtSxjkr7pIjDaYtzupBstY0t+ll+pjvnxlcn82wLCgB02dJ7T8h5MM7BAyFqDwsR0c7uFZocTJoDvMgo3oZw2JbmERVusQMugvwjL9Br19AF+ssKeZyojwaL01IIcP6DgDG6vh6Hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy/h2rRErN35Yv+OicHlrADRRzKxACkX8VbPYUb4gXw=;
 b=hM68efx3ErLj3J3DvNc299ZiryRMFyynBdLmJosiCdKE5Mz1RLVCCzgBLAvt9Oc3lNLsiJFT8+XM0l8CkTcMfNLe+ioFPVBGTDNkVjIgNuDRQ0ioY5I6g8KWH0JEJKQZxGge9QxuzcRTD8mjQgQkSHpajcI3sImHxE6dWlb3CarwTLfQtp9qtPTy+DuCOT3JcUseiU8YhXlJPSushuumW3w9vRMRQCKySQ7VF9oBg7eR8BCA67oSqx3snsfPFzfquTBqAr7/wZ2ir2EaPYxvEESSud25EGXyzAGsTPLNDPj1YsQlye0hV4wzT0JE2fhlnxxdBoY7r4ncEuhRNN9rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy/h2rRErN35Yv+OicHlrADRRzKxACkX8VbPYUb4gXw=;
 b=tzI2xcGrXSG489ad6rJpTBpPeMO28GzuXEfwox75HzouKOtEIwjsjJcNdl0Uhh7OlkdQSHSwwQxAyk/y6ZXJXu3MEKCtentDjWx0BLX3ykuUkKZ60mQu7vmtBw/ebEJOSvEqLMwB+w2W9AqZ6bvSqLh56Q7IWao1WsWnptYgkkY=
Received: from BYAPR11MB3128.namprd11.prod.outlook.com (2603:10b6:a03:86::27)
 by BYAPR11MB3413.namprd11.prod.outlook.com (2603:10b6:a03:8c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 05:32:00 +0000
Received: from BYAPR11MB3128.namprd11.prod.outlook.com
 ([fe80::c34:1c49:28df:c09d]) by BYAPR11MB3128.namprd11.prod.outlook.com
 ([fe80::c34:1c49:28df:c09d%7]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 05:32:00 +0000
From:   "Sanil, Shruthi" <shruthi.sanil@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "kris.pan@linux.intel.com" <kris.pan@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Thokala, Srikanth" <srikanth.thokala@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Sangannavar, Mallikarjunappa" 
        <mallikarjunappa.sangannavar@intel.com>
Subject: RE: [PATCH 07/10] watchdog: keembay: Update the check in
 keembay_wdt_resume()
Thread-Topic: [PATCH 07/10] watchdog: keembay: Update the check in
 keembay_wdt_resume()
Thread-Index: AQHXRwuDp2vSCESeBk+i16tFbIaEdKrf4K2AgAEDK6A=
Date:   Thu, 13 May 2021 05:32:00 +0000
Message-ID: <BYAPR11MB312817A43F0C5AA27F28469BF1519@BYAPR11MB3128.namprd11.prod.outlook.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-8-shruthi.sanil@intel.com>
 <20210512140203.GG1333995@roeck-us.net>
In-Reply-To: <20210512140203.GG1333995@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [171.61.67.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b78c84d8-2c8f-41c6-5e88-08d915d06ea3
x-ms-traffictypediagnostic: BYAPR11MB3413:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB34139772AA107BC0436E8CDBF1519@BYAPR11MB3413.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQppfB7WEPT3UGNhrfXfWh+RCJuk7KeFvz8mERsSfSJA2DfD+brSFUBjXklst3oiGJQdZGMECWdQAlJMCbfkR+lZbJVLqIIVW7mKks0AYmdCHD4HQgfM9fa4N5Q6DLW80X2YVqps9SxkZRd4VOn4nvsoV7DySsrnIR1sHQU8akm5p0HpXaMKGXYpCuxLsodvZpaIu6QPtAIjijEs4g9X8w+X9/2c51eHgYr1kARJy0Z7olZ+SeLoC6nggJu5T27OhDBNjFbG2uBG21ZnSRAw4/E1inedKxfYSzXi9Qe0R8tx49Z0mMT/4prpzr02+pNS8MTWCGdWkr+ItAjqO1+41xd+4Ugr5JyDYmiAnOzMVHitgDRV38aQuTsdOwofCyDOzLpcLc9nFB0ukkvPQnSzGawhzKWxJyarMg+tE+/LIlTRXjLtHSZG6+7UrEmiyLBV9mdnVB4ye68HpJP5HeDMElTtCPt41f2az6Ebem60GiqT50r/Rndb4v5q5j9+cZUSRqcJenqa2niZYgxI+WMITeBMhFtTGzPqEb+pgfddAaILj+yRtpcmNkpluktShcB0yM93aXJ7y4MQ/jwhUrjKDw8U1jnZRJiPQ9wv10WBhrE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3128.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(136003)(39860400002)(346002)(38100700002)(76116006)(4326008)(122000001)(2906002)(15650500001)(66446008)(9686003)(6916009)(33656002)(66946007)(55016002)(64756008)(478600001)(26005)(71200400001)(8936002)(8676002)(186003)(6506007)(5660300002)(53546011)(86362001)(83380400001)(7696005)(66476007)(66556008)(54906003)(52536014)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rTr+wEQBd9tnhwB50lYi7OFBRQ9OZI5nCLdajAPc6s6WKVQNRJQokyBCAK6K?=
 =?us-ascii?Q?eVrOuCk+O+Aa1PeBeZKBzi74G32KQbziJiyx8xXX3vEP708vLHCj67wZcIjh?=
 =?us-ascii?Q?g0V18rfl/zQceYGUkCPtAEpYATuMejymYU/MpI2Xcl2DPqx3fxc5JuX2ZJnY?=
 =?us-ascii?Q?F/IMDavh2/wx+wZ/Hnx/nskscmIgRUt7PngAOmKtOyhzdNSF8Ma6MYf7Sm7G?=
 =?us-ascii?Q?jr6LpajwZbM9QM5WVEuQv/Zrc6NvDoYcuaxM61bXq1FhWB88vEebRN3MAdyM?=
 =?us-ascii?Q?awl8b9DuYVqM61rAth4O7nuuPua+WION9bPLrL8o0cI0WzxG20zWhGTFvfn3?=
 =?us-ascii?Q?nmF5tX+4GvmYMI5V1nqmhnQBwUE1/mLhYWd2QcQWM6QLCPNjfbaVM+nKdsDw?=
 =?us-ascii?Q?7spgGtJLl+j8JW/A38tzpvSveeU8EZUkUL5mptfRe9v5Q6emrp2TPYvBFJnD?=
 =?us-ascii?Q?dPxITVEV9/Px4jv+fBhrw8NlKDtSxNEDKBXtrE3cK1tlzuFu0RFEBiNc157M?=
 =?us-ascii?Q?aWgcxpnDRYouLGijFoV+EmkOwz7ZxElA58k1lm1EDKUKeBMCUA2Vmy9RmFZn?=
 =?us-ascii?Q?anpE6jF1ektQjfV+YubhNeyzB26yts9JHkoGwzgR1VaHD/iQV5oJjOFNesZZ?=
 =?us-ascii?Q?H4oITHg77JO+MqR1iY2iZNXtGwEY5sUps0wSDbInoGe0dk0eaR9bsr4kZzQB?=
 =?us-ascii?Q?E0IIGnx5FDBcakt4WqwOOwTLx5+k+RUJlSzrfV1g+qm0cAVaFu3l3UlIxpfd?=
 =?us-ascii?Q?d+X8p4Id/weFaiBfYMSudC/+24MguzvgBy/vTAD1Y7gBUbxZs7MmJnBEmrKx?=
 =?us-ascii?Q?aE8ZsQfa+7WKH+NkBBvo+u3fexCiRuy0r/qrYOW7u30EBROSXHZUINZcA6ql?=
 =?us-ascii?Q?mHkl8PfqNzKPmLCrRl5ZeHPNadoeP+MzfOq3ADdie+qn3Ht/WuajZ8Xzw4QT?=
 =?us-ascii?Q?IgzZ8ufQBC9aa9KvuFdWq6l6aO2EoPlYHVLb1dT8XPSuMkhV5dknhgfEeYyW?=
 =?us-ascii?Q?/6/VQqXxi1sOqYrzTE2kakRxoc+ZKS5gm9k+eS892hXVNBHVx05PcdI5HTCU?=
 =?us-ascii?Q?8WAtqNrRFIVlzwnmHpffQnAGwBJV3vv2mdR+1WRZTEUAfsHoGYkYR0jM44Ul?=
 =?us-ascii?Q?IZBGrH//SJmbpku59hY5dd1KQWbY0bzaHir2fFAhK28bzE6latFrJd/rHqlK?=
 =?us-ascii?Q?H32oWJy0YNEfs0jJ9AmadgZ7UY/zS3OrerDXhe1FKO1OaJA2EMoph4kjWY/b?=
 =?us-ascii?Q?g+naVNOScTOGRAq0VaUPIFV74KWkYa8FvlTrngTl04H4AHpzI6ItnNG50SId?=
 =?us-ascii?Q?v8IKdlDuHEAcmNwdlu6+r0Ng?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3128.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78c84d8-2c8f-41c6-5e88-08d915d06ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 05:32:00.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ahjjrubwdbqL6S7xsKZ85WkHfJp9zKN4rvbLyoBaE0O4MMPvW1AemRNr0PkoHyiNrg0Av2JtA4ZNLMr6Nva67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3413
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, May 12, 2021 7:32 PM
> To: Sanil, Shruthi <shruthi.sanil@intel.com>
> Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; andriy.shevchenko@linux.intel.com;
> kris.pan@linux.intel.com; mgross@linux.intel.com; Thokala, Srikanth
> <srikanth.thokala@intel.com>; Raja Subramanian, Lakshmi Bai
> <lakshmi.bai.raja.subramanian@intel.com>; Sangannavar, Mallikarjunappa
> <mallikarjunappa.sangannavar@intel.com>
> Subject: Re: [PATCH 07/10] watchdog: keembay: Update the check in
> keembay_wdt_resume()
>=20
> On Wed, May 12, 2021 at 02:17:21PM +0530, shruthi.sanil@intel.com wrote:
> > From: Shruthi Sanil <shruthi.sanil@intel.com>
> >
> > Corrected the typo in the function keembay_wdt_resume, we need to
> > enable the WDT if it is disabled/not active.
> >
> > Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay
> > Soc")
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Tested-by: Kris Pan <kris.pan@intel.com>
> > Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
> > ---
> >  drivers/watchdog/keembay_wdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/keembay_wdt.c
> > b/drivers/watchdog/keembay_wdt.c index dd192b8dff55..10896415f8c7
> > 100644
> > --- a/drivers/watchdog/keembay_wdt.c
> > +++ b/drivers/watchdog/keembay_wdt.c
> > @@ -260,7 +260,7 @@ static int __maybe_unused
> > keembay_wdt_resume(struct device *dev)  {
> >  	struct keembay_wdt *wdt =3D dev_get_drvdata(dev);
> >
> > -	if (watchdog_active(&wdt->wdd))
> > +	if (!watchdog_active(&wdt->wdd))
>=20
> Have you tested this ? "watchdog_active" refers to the watchdog core stat=
e.
> Your code now keeps the watchdog stopped after resume if it was running
> before, and starts it if it wasn't. Please run through a suspend/resume c=
ycle
> with watchdog disabled and see what happens.
>=20
> Guenter

I had understood it wrongly. I was assuming that watchdog_active refers to =
the actual state of the HW. Hence I made that change.
But since watchdog_active refers to the state of the core, the change that =
I have done is incorrect. Hence I'll drop this patch.

Thanks
Shruthi

>=20
> >  		return keembay_wdt_start(&wdt->wdd);
> >
> >  	return 0;
> > --
> > 2.17.1
> >
