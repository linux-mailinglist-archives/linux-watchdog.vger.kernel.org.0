Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2683302095
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jan 2021 03:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbhAYC4x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 24 Jan 2021 21:56:53 -0500
Received: from mga17.intel.com ([192.55.52.151]:60244 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbhAYC4w (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 24 Jan 2021 21:56:52 -0500
IronPort-SDR: m9xnPWqdYC5lIhNsgg0VTBhaz7OEXJcR7s9W8cxL00LJ5Su6UcBj4cMQ8EsOjb/3njidcT8InD
 ufsU95xK3h1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="159428669"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="159428669"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 18:56:11 -0800
IronPort-SDR: oYPNbJ2+Rbg7pW3NmsQpuxmpXbwWsstlJ2jvOv7nJI6JlKhGPGcvNumJ78r+phZlC1xzitG1K2
 umUn9OChxQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="387112281"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2021 18:56:10 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 24 Jan 2021 18:56:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 24 Jan 2021 18:56:10 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.52) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 24 Jan 2021 18:56:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ69F5yN/MJxLYpLTOElo5n3ZFONW6q/BVH6o8VJ0W1OcFcIYo2p3rgCfMBrPiuHfwgFoy29SzeXfne0zTrs5sbc2EorImwIzb7rldWXvR5ED41PL41XsbpAmxg/izS2gJtbq5nZUne7/uO32gz2DDjiSGjo7HwBQSVcK6mD8EPGXpyL1r57b5AFufWfps2yd6S8i48IdLJiglbtASs/pk1tKNwBvPaLhGJ/ODQUibu8oFEGbY8yO8MZ04513uVjeRSNwQXNM9A3OnN5NH1Nh4YiyjZGz/ON4MFJheibiAU5DXAD7B7g9WSCz3bqvut5Gti6IoEKoZ8wPyXd9SGwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEl5f0/FTk+z9XIxB/g6ew4s4LdsyFioKa/I1hpjKWw=;
 b=cfB67gZIt0OFwQbCsjnQB1H8nTcgXCwIBJivOjImOzpoLZA9mNiGhBC2lSUElaWIieaEXOfaI8Idsd6i5KM3LkYup/ZVy+Jkh1NW/BZJH+JfeJbBkQ8dEQtVuTIscWtk/ovbLauf2rT+ZMhHRY/JKGW0a6fpmH7t2vpWt27OGyQDdmeSCKjRtckoOUB6XNgt/fNNdQ5yGiuOZNvXx0A/ID18ThuNNdtGQX5oayjJgiTmRaBEGcrBFZChwqJ8uLioGXJbhbNpEU65X/mvfwgLAxKKLx/PdT1Ev3j1y935yX6xjEPPW5xR55N8rLUxgxIf3fzSEVEtLCe3Nc9K8BCXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEl5f0/FTk+z9XIxB/g6ew4s4LdsyFioKa/I1hpjKWw=;
 b=us6zQpxOBGiDOweCuC87j2ZK7PtkaDrJEJD2OqUbxGge3jntdkYWOQqsWKPxIxtEi7x3NTCnvONBDmvWaIo3K4gsCLLD7OWzOudkMVUP2qCqc5cPMZsvJ17Rxo/pL/V3AHPWePgO+T9nhKeMH3LkAUlgnUiKrf4oNyVb/QZOsxk=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 02:56:08 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f%5]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 02:56:08 +0000
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
Subject: RE: [PATCH v4 1/2] dt-bindings: watchdog: Add bindings for Intel Keem
 Bay SoC
Thread-Topic: [PATCH v4 1/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Thread-Index: AQHW09gFyPCx6752qEmZSocYxv7B7ao1r7YAgAIzLPA=
Date:   Mon, 25 Jan 2021 02:56:08 +0000
Message-ID: <DM6PR11MB4250D56492161A14493760D7FBBD9@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <8c4dad4fb8ba644607aa9379d5ec70d8707d7e75.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <20210123171800.GA55726@roeck-us.net>
In-Reply-To: <20210123171800.GA55726@roeck-us.net>
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
x-ms-office365-filtering-correlation-id: 292dc712-ba51-4720-ea93-08d8c0dcc3c9
x-ms-traffictypediagnostic: DM5PR11MB1897:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB18974846559D41DBA4BA1692FBBD9@DM5PR11MB1897.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1yWqsvnSuYPw6fOxzkXZUELVihdYsAskv2P/6yKw2cd15EIee+8fUVeTwmEmH6/tAjEvvsbnIepA8Ubi7RZOMDjGC5aZ5l0eQYRzXNEitjMQlZadcQCd3WRWvPwgVtODItcsJiMIkIOYt1apO0O546RLDG5ZU1VmcMUyvuJ8/y7z1md2LZuxZbt1znqaSn1Vh3Ez0+uPSyMNNyjJRsNpbcp/qDwmO20LnLq7e2O3Wp9CvP5NyAKWCkQDr2yGex+PV1W+XO+WLKjSPbG21gy7+wq/mOF5QsFyDe/rMusRegt9iFTYldT1KwbznheJr3OVwmmf0ljuH7mC9ykXxinouYPjcm7Uxfu3cFYkoXgV7z0FcUuaMX+OGRDvU9hgPa0y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(316002)(6506007)(186003)(55016002)(33656002)(9686003)(8676002)(76116006)(54906003)(66476007)(66946007)(66556008)(2906002)(8936002)(7696005)(71200400001)(478600001)(52536014)(5660300002)(64756008)(86362001)(4744005)(6916009)(66446008)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fqNYZABV6dxPrO+tDjHUEd30GXWecVhWaMsa+PYTaZdQIt73LunLOXpwaZw3?=
 =?us-ascii?Q?J30G7mNzdV+zuAQLvTwND3az8Ul7RvxPbVph4pgR6SI60PnjnYpt0ljMQGC1?=
 =?us-ascii?Q?pE0S6nKY3cZJJWF2zo7BEkxRVDCFqbie4O0jy5r+QAvqFWGh5PBSeIZpfORE?=
 =?us-ascii?Q?TrlfCqaHYs8Gz9QUJax2332EpmROp5d2U+P/6hj5j690KFmO+cylPvJ4TJva?=
 =?us-ascii?Q?aPu0c3O72swrUa/ZvhMpiOqqPHBS9hGJ98zev1zinDNxc80v1D39t/v7wwzX?=
 =?us-ascii?Q?JEdH4v2FXYWrqTzDnJXFZWblYuO4AfjXttSx+sDNua6d0jGsHaP5wcfLUAUg?=
 =?us-ascii?Q?CiTPMKuZMB3PsCOlG3T0QmcEUXYdSzajnQfxzDAmRoQc/rp4QoiK0C+VzVo8?=
 =?us-ascii?Q?ncqO2U8JsiQe9GxY3FKsLJqcokPlEj3oh5gfX5Usri2rSeBwfznhLtyUW+rI?=
 =?us-ascii?Q?ZZSXOZjEKXH/JXClpgsCaxMw9+cMTlPBq7d30/Onvflh+206sZyM432UngR9?=
 =?us-ascii?Q?KCP3iwMHrzQBKH9gBeijk0ydzYXu+xy0VUGrLpmJtjBpP73E53zXDsAwS0b2?=
 =?us-ascii?Q?nJhV46HJ+GB9zL/sJUgVUmp3XWc6YAl38zPjwNV1+YFdttaEUmk/vckQ488K?=
 =?us-ascii?Q?X5aJNgKrhB0565sR5FRSr590kH+uDX+n05T5JgLaHjIQ1bwBPSlJXzUCeBS3?=
 =?us-ascii?Q?aUpOfL7AqfMhviYzGfj0M8BOpTfeoFzQ8Fp9/sc01UhjonEx9A/uFHDuQYPE?=
 =?us-ascii?Q?BHVkF+z6YCvog5uLNOFEFESUJaK9yuk7x1n4vSAO6BHn4OZCtJ3lz28UMBqz?=
 =?us-ascii?Q?6aBgsZH+v3N7fjBsF3h+zH2XhhaYcPvqLkbly4q4u5koGtwHG76+cC6V3wOl?=
 =?us-ascii?Q?Z6QT/Q1KZq5G0oyOumdQwboIc41BM3WjyTpvcLzInkNhtYYd4Va0Dtxb7Zm4?=
 =?us-ascii?Q?DIBEMRxGcUn0fzzk+ys7RacBaPsVrgugjujBClx4OpLQVXvBw4zDUyTVBmbd?=
 =?us-ascii?Q?9t0tUxH78S1Xu7SNh+YZi2KXL049bcnwP7f0vHyGW2hKa9DGHRUTYPGAe6e6?=
 =?us-ascii?Q?UErvyZrF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292dc712-ba51-4720-ea93-08d8c0dcc3c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 02:56:08.1703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Udl/Pf04iMGqChpyAwDhDPyX0xsdyUShVZeOTkNUY0/BbbNuqQjsuQvWqvbaHWzPlFvLN5fl/RFLh5s6vgl/R16OcXO+PmWc7CIn5kV40KTxIw9W2bL8G9PxWAChb0k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1897
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> >
> > Add Device Tree binding document for Watchdog IP in the Intel Keem Bay
> SoC.
> >
> > Acked-by: Mark Gross <mgross@linux.intel.com>
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Vijayakannan Ayyathurai
> <vijayakannan.ayyathurai@intel.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>=20

Thank you for reviewing this patch.

Thanks,
Vijay
