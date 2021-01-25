Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2C4302097
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jan 2021 03:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbhAYC6A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 24 Jan 2021 21:58:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:23115 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbhAYC57 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 24 Jan 2021 21:57:59 -0500
IronPort-SDR: 7cGRsbQuD6EKYUcIm8lLp18RU3GRRN8y2/QD/HDAMRhXrbre1MFal+ozgQ3F64vU33wu25I+tH
 t/iEJLekrj+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="176142875"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="176142875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 18:57:18 -0800
IronPort-SDR: 7Z01trv47VRrQkU7FtvQEx5gMZx2SyQjUowrwBCpLDXYNtiMv3cvPfBQ4YYwLKkNKseJZUZ/2a
 gVTusGqyqDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="572048197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2021 18:57:18 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 24 Jan 2021 18:57:17 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 24 Jan 2021 18:57:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 24 Jan 2021 18:57:17 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.55) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 24 Jan 2021 18:57:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOpgNUW3WDDAOgw3j/XrQeH9cIBs/SCDwxgHR/Tc/o7h3jCU+qCXRysmgN+k8hz9hcXFCBHdmq+rd5o5nlDf0ZKmvi5BrqcWOdtgIMlVA9tN60diA2//3qFiGUGn4iQj2a67MxoSiWMQUM9EOME2dBgEk1vw2yfGj3DQc1CYpbj5zHPv+P4G8xU6jeCIqC2A9dsP9s3/GIJy8v9NqFijKNkP63TQtwuwRESF7y1I2lTclQcSAkuSYqlcSepIodneUNfYUNm8qiWPHSEc/CzAKD7+UxuxN32HoeTIGzGUDG6RSwBzVNxQu3g8i83m8fXUiheGu2ITOCx3XNvrecqsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AYWFWtCRtx0yOCyZ1ntVVcksRqQYUa51ApQS0Zt+UI=;
 b=eVsmWqoUWH0ApMlydODBKqmw/SKAEwN6/BRQzI3H6ZIcjCHDFc15aAw0dO0Y6CEj5iIiEcB0hzFZa42Yu2LXt/RzyYNpZF3zZJtq1AQutVMJGMK/ExfwGO4doGHbkD43AQKRH0dM6wptwWqlHc1Ihel9L7S/KhGm7m0NxVWEh3qtETZHWAvDjLDkHtPbplCr+NgPN74+mME+LSwSR8Jo0sLYbFi8Mcl84kn0RjRlnPl6Mt58LeZYP5o8pZj+X3OjGxQH9T1hbKxFAtKjQ9vo65f4oFaYmEqKrQfulbnpWAyKSrFdB30lHqas2k/x7RE8qRCKqp4ihGbTP6obVPnLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AYWFWtCRtx0yOCyZ1ntVVcksRqQYUa51ApQS0Zt+UI=;
 b=KctKanYena2wJu2LjxWRr8TD3+YwCT3/ZVOubw7PbWA36uet/0FCYY26jbtB7eOy44bqHs33qIQTuRJWZgq3oIMxtgKV/tc2SrofyV7PBeqIS8kvaBVbqeUPRYoW5k675nDXwTajlBp4gax1xifcNq3khmru40n9KFg2l1VNwnA=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 02:57:14 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f%5]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 02:57:14 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Seow, Chen Yong" <chen.yong.seow@intel.com>
Subject: RE: [PATCH v4 2/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Topic: [PATCH v4 2/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Index: AQHW09gGfWE6o1nwZUy3/4wxqTHhD6o1r8QAgAIz0xA=
Date:   Mon, 25 Jan 2021 02:57:14 +0000
Message-ID: <DM6PR11MB42506C5A42DB89652D46FAC7FBBD9@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <26d74f46ce74488424371dd3e16aa38508fa6c2e.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <20210123171812.GA55759@roeck-us.net>
In-Reply-To: <20210123171812.GA55759@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.176.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a12d59d2-2237-4161-0963-08d8c0dceb7d
x-ms-traffictypediagnostic: DM5PR11MB1897:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB18979336439EB7CD81B0BC83FBBD9@DM5PR11MB1897.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZB/Iz9ia7k3UhypK8W7Q+zTfUmgHXsAopHKcbnKqzs/GKYRxz6hBfDRi0EwAkbduBM30GFz+WaOBD/xrKQGeqfpuh8mcz3SLOngxettca8lZ4gSTxZbrzY/LsdGx/YmFtheOTCfA2EMILXDWpwx7tRnD62YZ+vpp2i5iKUWgleG3VriEOksqEkuvaU3okfux7sb+hqMPViQGqdYha1I1JJL/0tcJbbbfXie3pb+M6hPMrgBxuVu4/+uSuh+tDYraK4H0r1iFOFfaZntdfokwBVQtnNgz6crjnAvZNNFJfDKzxqdGLjHQMRywejK3xydFVa32Z2KKkx1MyMq7VBsjmnlfraDqq3yoQ4rIGJNfBWA7upa6u0YmZqjQ5PxfbJqfDYW6Ynt7jwcKd9fzCRgmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(316002)(6506007)(186003)(55016002)(33656002)(9686003)(8676002)(76116006)(54906003)(66476007)(66946007)(66556008)(2906002)(8936002)(7696005)(71200400001)(478600001)(52536014)(5660300002)(64756008)(86362001)(4744005)(6916009)(66446008)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YgsDUwVcxGK6BYrrkX8La8ke7hCZISYSfFdsN2SawOYyFsRl0RipMTKhSxD2?=
 =?us-ascii?Q?Vpjy7Hn4LSQNa/lFeZUD0YXeZl/qOccJivs47U9sn46OfnR7/hT6Zc4DlAH+?=
 =?us-ascii?Q?HFuK5Kgj25RIcSq0cWj4Gu5Wdn4sPLHE9E7dNk8Yd2uZidwqquDdQTOcusNz?=
 =?us-ascii?Q?oOsUtf0YLKhQCKfWl0/OEVp5yfz+b3UKb21K/EJWMnz25pQrVcBec0ZjMrjc?=
 =?us-ascii?Q?ZJqxNpGRJIGiO4K5KnmdjoCPyIMlJ7EoAx4NBcLdJ0YPl3N7Qgp7MwRusRKr?=
 =?us-ascii?Q?4/f2DuEt+JlEcM+RrgZaHDzn9zyLgiiHSuD9p5n6MKu7juUXpWnyUvsfUdEL?=
 =?us-ascii?Q?5CqC9eEw3laYl+OVNRJXM3bCckNywda1R6kOxq4GxXz963NNQbLHTNF9CMNW?=
 =?us-ascii?Q?rr5g9iv/PB/LNqDpUsTNMF1CpiNM2AgtaaPZ+JTF5C0163k7fvtK1OeQ7R0H?=
 =?us-ascii?Q?Bc3qA3LCYrav1x0yqMYLuVZNuqud8DHfUfXD4PH3+YmlZG1f6jQrngImubVU?=
 =?us-ascii?Q?A7SL40gOV9/C8iuc3Ipgi1QTB9ITZ6G80qRI4FXDpBLpELlNKDmD6FVMcWhg?=
 =?us-ascii?Q?iTLLLXM2PjLCgLhB4QWG8489jw0cx8oIz3ppBNgR4uBOVeS5W6Qnwzd89+gI?=
 =?us-ascii?Q?LVnQV+OH/FiJ+Y0VVY8AxgMIRGW4Q8YP6CxuzYkMB1EVufl8Y30ScX8Pbnnf?=
 =?us-ascii?Q?6px5i94EPVyTG9PdXr9SYLjT+duL/6GQ+5WzvS/50V7IDssT360w2XCLwHpP?=
 =?us-ascii?Q?gyvjVe3NcNeB3zMmYjo1VIffq7gk8JmMm1aBfUEU8FIEj+Y/fRssPJhauXhC?=
 =?us-ascii?Q?JNhW343eJL6pW93pzz6HnnEw5X/elLkm4qTeTEE5Oq9GTgHV6NyJ/fMAV8sP?=
 =?us-ascii?Q?eCW5HNZTeBX4KuQDAoCG8c0eKKxy/egHXP03aiZHTqIy12eXj0WrDcswayTO?=
 =?us-ascii?Q?/G4xr+QEN5bTYesteuFWE47RL7blfyb4/xGrB2cLgOvdzI/g8LgHqHmGyycw?=
 =?us-ascii?Q?B7EKMhhsyIXKY1Mf4K2v1Ekpf/cl0dkeovvPs8linP5+ndSPeZwqIftzMw3n?=
 =?us-ascii?Q?JzOocxYz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12d59d2-2237-4161-0963-08d8c0dceb7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 02:57:14.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wd7HRysH1w15/EGXzg2XFitxmiUKEd7PIxaF09czUsoR62rEMQlHVdj+VSY0SS/k6VfEgjq6RFqV//QelbA+j6wgLN60bq20Vqmh8SoI/PoOCnrKdkmo5SMoyLBwWaz8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1897
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> >
> > Intel Keembay Soc requires watchdog timer support.
> > Add watchdog driver to enable this.
> >
> > Acked-by: Mark Gross <mgross@linux.intel.com>
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Vijayakannan Ayyathurai
> <vijayakannan.ayyathurai@intel.com>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>=20

Thank you for reviewing this patch.

Thanks,
Vijay
