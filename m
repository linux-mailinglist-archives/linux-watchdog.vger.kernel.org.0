Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC4A38E0C9
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 May 2021 08:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhEXGIP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 May 2021 02:08:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:12062 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231605AbhEXGIP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 May 2021 02:08:15 -0400
IronPort-SDR: 61KdmMU7mgIUfklbZ7AK1XAnjd0ajhgO5mktiAJlyFruIssSRdzWupWMJtQHyj/Dsbzx0aYc9T
 rb+Ad/qbIB5g==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="265760306"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="265760306"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2021 23:06:38 -0700
IronPort-SDR: gmvfq4fJxI1OLicHLhXU8+JhUAwYc60KMwBaeaJhBeYvDuXYdpR2sE1584bLpoA9NOeZgVA+zg
 4UiFUxKFG/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="470420764"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 23 May 2021 23:06:38 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 23 May 2021 23:06:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Sun, 23 May 2021 23:06:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Sun, 23 May 2021 23:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfFCudpd+4XLY8UcniOZwaium9eZU3RNdUBigqx6lJsYGgRbXPgEExeeVuO4TzH4/G9jqPQiCCbH9LOgB5baLIvU4SODGqha6h1nXIlrwmnALsvp8RFBqGeo7ZzPIWPM+ypmjVtokSE2Yz1CtIlqKmiXnVzyggmmlcbbz5gCpBFSPyoN8c4M7SVnDNy1oofmA0u7a8y90ehSsvvP5topbrRdnQQfLdKwDU2DWUoSuSwaRcDf1slhliYDsJLZVZ2ylrkbhtyPXfVnbdjCj27JUeBAIKS3YNzcw+qTPwwmMGi2ZrdXigAx8gbABNTSxifBjMY6I00e4IqPxF6lT+1XPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YTdKPrTrCG+/8NNkb7GkLCrlLeQg01lkj1EfEa4Pco=;
 b=QQTyWvK9lflvJMalYa6MiArJAMFQgLi3IEc/V26IUXPfzn/dl4+OZYtfyIrwGy5zrS2a8ktIwkUOqwSVdzM2KVRHzTIrtDxH50ud+EB7lXl3RUj4X6hPAasw0glibQ8NcpqEki2urrCc7BlvSbzIFxi0P/v0iye8nUTlWUSemtiKgR6Zyb5KgdhmOrSMiljg7GLgLO1BfSAJbgWVzsn4gJ2vBUEJ1gpdZUE9eAei8tijypjdG44guBD7ShDtiz3xmaJvSkGPneeVQVQ6kpSKdpD0NIHMBf7G2wmfaLjlgei41YVZfJMgkW2Phck/+qq1g/s8fHKpTPHOPrSIKTPMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YTdKPrTrCG+/8NNkb7GkLCrlLeQg01lkj1EfEa4Pco=;
 b=YGwm1gRAeOIeErK2rbml7R/C2xQIicOUcG84rxOzS4RnVkWAK0gMQWGHn/nzOycylqJ6mvb5LpvWWj87IPl1/nzn6GxcEQTaiz16H4DiW2VCc3Qi7LfOD49b1G8ldn24dEUA95dx3rnaAxhYNxrJLGBnf8IVg2bQyeAUS7/+Zag=
Received: from BYAPR11MB3128.namprd11.prod.outlook.com (2603:10b6:a03:86::27)
 by BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 06:06:35 +0000
Received: from BYAPR11MB3128.namprd11.prod.outlook.com
 ([fe80::c34:1c49:28df:c09d]) by BYAPR11MB3128.namprd11.prod.outlook.com
 ([fe80::c34:1c49:28df:c09d%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 06:06:35 +0000
From:   "Sanil, Shruthi" <shruthi.sanil@intel.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "kris.pan@linux.intel.com" <kris.pan@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Thokala, Srikanth" <srikanth.thokala@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Sangannavar, Mallikarjunappa" 
        <mallikarjunappa.sangannavar@intel.com>
Subject: RE: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
Thread-Topic: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
Thread-Index: AQHXS0UQwE5Lr03kIkKFzNcT4kAAcaryLZOw
Date:   Mon, 24 May 2021 06:06:35 +0000
Message-ID: <BYAPR11MB312848D2D369C78BD2E969F0F1269@BYAPR11MB3128.namprd11.prod.outlook.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
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
x-originating-ip: [122.179.88.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4556928a-d65a-4df6-e74a-08d91e7a15ee
x-ms-traffictypediagnostic: BYAPR11MB3736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3736FF2F9026A2EE0A570027F1269@BYAPR11MB3736.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dvhKnbW4777562sUrio3a5kUqdPTVJnJlsb/VWmOB1jb3GGmD4VzR/v7WngtYSwvm7+VuawVmOWfFk0k1DgWbxc/bLBd3rxqJEdZZ2czD89sPJ+2vuURtUFfd+V9Bl/Ry8R7xezu3+d0I38olHOy6LJUtaTMharcRmBwEACA1Ia5TUfYakD88Llt40q//GdwtzrmUSIOsyNpGE0yRj1s6luMtHUAXy6dASTkEhZamkL0MWe4wR//2wyCas4Xz/kpCRqOcLej2DXYt5j58WLEsXGARJBuq2AQec+FVBeMFCOekHkuK18cIJyA3wsdJGIAOC56tyse9awfdcQTJV4fWGLngo3Yc8ZKjD/y7Pqg3PsIMB0yRyajTbBw51MP6iZIIebWg05h+vpDXr5OwM/2Ag+zoglRDDJCFxirMmS2uo/3iF5/5oqM6HnVi6zl+6CsCiPTUoMhDwaqSENSQf78BcaDmlGsKtdbi8ecSvWQ6qx8P/SO7IH7yJlfBPdtDCmlfMYgj095ute/6My6yTFU1xG3FeW2xJxE3cLbCbAG+oXCLPdOxUd8+95r4DtKg/KGOl0Can5HlyTHZE+ysk/xo6pTdpiiWLgTdPclb9TD9s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3128.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(366004)(396003)(136003)(9686003)(71200400001)(8676002)(110136005)(53546011)(26005)(316002)(4326008)(54906003)(6506007)(7696005)(38100700002)(122000001)(8936002)(55016002)(66946007)(2906002)(76116006)(66476007)(66446008)(64756008)(66556008)(478600001)(86362001)(5660300002)(83380400001)(52536014)(33656002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?caYxXswVsd2/FhY9FqX+qS1ficaKVSnmxKzDYtUAMe5IRqbpws9CW0kcyWFY?=
 =?us-ascii?Q?n6dLJuf6Ddgmlz4C5XYPANdDIMj3SM8BQzXVZPb4w8C/urADdTFhpTsEkY9D?=
 =?us-ascii?Q?07RUudjQnE7pD3gf1VNlXcTsJIG6NIzcbGTVg/viw2blmQqI4jB+KkcTC5Vb?=
 =?us-ascii?Q?gcVx5HbXUFZqQ7mvFG7JEcC5LbQnSSypeByiKcvqXf5SxFbC2Xsg9hVde/Ok?=
 =?us-ascii?Q?XFDaUarAX2MJtv51WmRqiBGaD4zBNv5+K1PN3qvI/eGewQF8IWGINHyWEheM?=
 =?us-ascii?Q?b4y4EuXHmOMDl5dcJIbd5tWtHJjQGyX38pSxfH3QeYgbKvspDp4bnmL5LP3f?=
 =?us-ascii?Q?G+9veLmdmBcy8vMhfaHrKz1tw3iwsSiCuoyl6I5uE9GLSvGSCLrD4zKyyayk?=
 =?us-ascii?Q?kQxdDCq1xK0DoisD+DygwQCH0gfJ4xVOfq439vvrVL1HgnIrBn9aDxECLnmO?=
 =?us-ascii?Q?q02Na5gF5mhBMu7KxCRoo5kbSbfRxR4FmwZRlOEXb9ji1Aq13+NKe8hj+nmK?=
 =?us-ascii?Q?FuB6cES36Rrs+tiqG39G/4QXfq9IqK1STHMD9lCfdBZw8/Xm41HtnIAp8Hgc?=
 =?us-ascii?Q?AGbQknhZleJSA9zztluwYawadGVdrA5uew6/s+wWJZMwmNpTifJJBVPT6FPm?=
 =?us-ascii?Q?lt3V3XM7L7r7Hxk22DlbkyoRH2ciDPc+k7cZ5oq7AeJBjpyazV4umv9M0uGG?=
 =?us-ascii?Q?n0MVzLkmOZRCQXYydk75F/pxjOsyNX2+VFomdG/SDz41UudTtciEy9kuqTlf?=
 =?us-ascii?Q?IcWch/kCBrrq+MiO3t/evxy71tkREgUnOZOw8RF4jLMPHIm1i4NP8YwEjMNJ?=
 =?us-ascii?Q?7xDrtHTa+HNWkgDjT64qnAvGBiTe8k3L7iMe5xnE5pl7SPjU+lAwYpK22M+y?=
 =?us-ascii?Q?l+gvRtqoMVV62HsdOZqHhld7nRTNDXkV6VdBHEqlTcljmtKMe3b7Qatcexcm?=
 =?us-ascii?Q?riBkP+U9OeFLVlwHWDh1zJL/Q1+ReqToCu0eIHvZpvCvmGfLlAOSaju2IQc0?=
 =?us-ascii?Q?3k078N8iCoEVcAM1LNJJGRbDY+xCEUF2d1ReakLABasS6IztGltdNzieAmna?=
 =?us-ascii?Q?N1V2sSgFcbSVWwLyeeTwVhuqxsXQ78zSivRoHVZairhfqq6i9BLEi1ZHXWcz?=
 =?us-ascii?Q?fo1tlD2/jFLAKkoLTxiB3ZY5V91njf7GUmSW54Gi0wgJsQs880oaq3TrwZgO?=
 =?us-ascii?Q?mKy2TxpCINZeviclNTSLF0+brdBt4knuywvxrHkWUK1lxO43b/LmmUJJB10q?=
 =?us-ascii?Q?fiqACBevaDgoVQq3NNdsu+IMCg3AAvPbhvEHSQlp0NaNx53GnkoMnVXMPUBT?=
 =?us-ascii?Q?C7L6bdQVusIziD8/PPKZ2/Q/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3128.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4556928a-d65a-4df6-e74a-08d91e7a15ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 06:06:35.1488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9Ljc3PCbuOECrujnpLfx7brUTI1BH1M1fgMDFrX9kJLkK7DIUypMqaz6pBn+H4YxK5MOh+nZU2vRPjMhOg9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3736
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Roeck,

I have addressed your review comments in the v2 version of this patch serie=
s.
Could you please review?

If no comments, can I get an Acked-by tag?
Thanks!

Regards,
Shruthi

> -----Original Message-----
> From: Sanil, Shruthi <shruthi.sanil@intel.com>
> Sent: Monday, May 17, 2021 11:20 PM
> To: wim@linux-watchdog.org; linux@roeck-us.net; linux-
> watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: andriy.shevchenko@linux.intel.com; kris.pan@linux.intel.com;
> mgross@linux.intel.com; Thokala, Srikanth <srikanth.thokala@intel.com>;
> Raja Subramanian, Lakshmi Bai <lakshmi.bai.raja.subramanian@intel.com>;
> Sangannavar, Mallikarjunappa <mallikarjunappa.sangannavar@intel.com>;
> Sanil, Shruthi <shruthi.sanil@intel.com>
> Subject: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
>=20
> From: Shruthi Sanil <shruthi.sanil@intel.com>
>=20
> The series of patches include the below bug fixes in the Intel Keem Bay
> watchdog timer driver:
>=20
> Patch 1/9:
> - Update WDT pre-timeout during the initialization
>   The pretimeout register has a default reset value. Hence
>   when a smaller WDT timeout is set which would be lesser than the
>   default pretimeout, the system behaves abnormally, starts
>   triggering the pretimeout interrupt even when the WDT is
>   not enabled, most of the times leading to system crash.
>   Hence an update in the pre-timeout is also required for the
>   default timeout that is being configured.
>=20
> Patch 2/9:
> - Upadate WDT pretimeout for every update in timeout
>   The pre-timeout value to be programmed to the register has to be
>   calculated and updated for every change in the timeout value.
>   Else the threshold time wouldn't be calculated to its
>   corresponding timeout.
>=20
> Patch 3/9:
> - Update pretimeout to 0 in the TH ISR
>   The pretimeout has to be updated to 0 during the ISR of the
>   ThresHold interrupt. Else the TH interrupt would be triggerred for
>   every tick until the timeout.
>=20
> Patch 4/9:
> - Clear either the TO or TH interrupt bit
>   During the interrupt service routine of the TimeOut interrupt and
>   the ThresHold interrupt, the respective interrupt clear bit
>   have to be cleared and not both.
>=20
> Patch 5/9:
> - Remove timeout update in the WDT start function
>   Removed set timeout from the start WDT function. There is a function
>   defined to set the timeout. Hence no need to set the timeout again in
>   start function as the timeout would have been already updated
>   before calling the start/enable.
>=20
> Patch 6/9:
> - Removed timeout update in the TO ISR
>   In the TO ISR removed updating the Timeout value because
>   its not serving any purpose as the timer would have already expired
>   and the system would be rebooting.
>=20
> Patch 7/9:
> - MACRO for WDT enable and disable values
>   Introduced MACRO's for WDT enable and disable values for better
> readability
>=20
> Patch 8/9:
> - WDT SMC handler MACRO name update
>   Updated the WDT SMC handler MACRO name to make it clear that its
>   a ARM SMC handler that helps in clearing the WDT interrupt bit.
>=20
> Patch 9/9:
> - Typo corrections and other blank operations
>   Corrected typos, aligned the tabs and added new lines
>   wherever required for better readability
>=20
> Changes since v1:
> - Dropped a patch with the incorrect fix
>   regarding the WDT suspend/resume function.
>=20
> Shruthi Sanil (9):
>   watchdog: keembay: Update WDT pre-timeout during the initialization
>   watchdog: keembay: Upadate WDT pretimeout for every update in timeout
>   watchdog: keembay: Update pretimeout to zero in the TH ISR
>   watchdog: keembay: Clear either the TO or TH interrupt bit
>   watchdog: keembay: Remove timeout update in the WDT start function
>   watchdog: keembay: Removed timeout update in the TO ISR
>   watchdog: keembay: MACRO for WDT enable and disable values
>   watchdog: keembay: WDT SMC handler MACRO name update
>   watchdog: keembay: Typo corrections and other blank operations
>=20
>  drivers/watchdog/keembay_wdt.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
>=20
>=20
> base-commit: 88b06399c9c766c283e070b022b5ceafa4f63f19
> --
> 2.17.1

