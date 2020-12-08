Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934B92D20BD
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Dec 2020 03:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgLHCWi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Dec 2020 21:22:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:29145 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgLHCWi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Dec 2020 21:22:38 -0500
IronPort-SDR: xpwRsy8sik+ZalcpTlCbGA6JkWB0YP3D6iECt0pLksqWTEayLJ03XxPytJtQ9+U3cLzK32WiWo
 M/Hgy1v/I4BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173050417"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="173050417"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 18:21:56 -0800
IronPort-SDR: r7BNDzHCz7AMfpf6W8Oohsc5tI85pxmynM8f8ndTAVaY+w+5ixL7NkknZcyABJr2T3iaNLAuMV
 atGc5G2jVoCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="363433432"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga008.jf.intel.com with ESMTP; 07 Dec 2020 18:21:56 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 18:21:55 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 18:21:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 7 Dec 2020 18:21:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 7 Dec 2020 18:21:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFx9EgsJvjJOo9nGJKWZ5p7m5CBmVkyIWeQg8uI5mcuGMXtDPybL+n4iDF3MSk8Eg/i8pZ17pD6khQGthFwxLpM9uS1Fdo/N9N4GGk2uuNx0+jJgf8nzfkm6Txyu661sU3VysdU214SNWrlLyi6yVaRMr2xPVl9ZQLevZCAKqp8oZFPNnBto1k4+NwA9K/+xC1kTdsubCpQvxMiobw20OrVTS/P2nspvH1R9zPhZN6K7m+d9jFoSz/NPIYeBOoB7glINK+KZb/Y4Sx72VYGNo58VFO4ZrroOiZ2CnkhDlqA5rAJuyLPtfU1v/oeFFPO9EAzIyam6fiOt5fQ7Iu4nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNXv3NymmD7CNZ0uJmatvkxMtK5v2WyVGWHLsktNtIE=;
 b=CTQgj/y/SQ4fODLF8rEZ339tiNyFzH5QjBHB+XbiFXKfM2vSzUtASgewH03v6Jnig8BmYMVNQ7aP4Wieoo5DGXMCwjgtZjBaxZGdZUUNOkouPtMm5WeAx4lEq1MdEQtyXLddNN1COxNICusP4AlB/0aL1byiKA7qPD0oMkHRkfXnFxH1Btajl+hfQTXscrqmOiYK5t3QQkfqlaI+P8NnLqtbPJYM8zlkEWRUTr+rV78NjViJSR3IdiF3VFYBYR0rrUtJR6oM0WrKG0jdcFTfGpykcxXJKSZ3u7jlSUvwDayQG4wxUcrPLPRMKzyQXFUM2TT31eyNDYjbVo9ey4eQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNXv3NymmD7CNZ0uJmatvkxMtK5v2WyVGWHLsktNtIE=;
 b=e3/oJPUmNrc6V4/Um14oNEm6dPpj5h4veVja9JLfyiw+VgmSkvyxWcHL/HvWfMO+UaPX2/gTpXem8As86lMgPJswFAOtGKaPU2SKi+ViPV/05jU7l3vhjUEh5pu4HZ37Aw5cV1r5kGRSyZGVKk4gZ7WbJEEqjuL2R2N79uaT+UE=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB4186.namprd11.prod.outlook.com (2603:10b6:5:196::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 02:21:53 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 02:21:53 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Rob Herring <robh@kernel.org>
CC:     "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel Keem
 Bay SoC
Thread-Topic: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Thread-Index: AQHWx/CMPyJ54KhtzECLIIMtmp7yx6nr/CAAgACEyCA=
Date:   Tue, 8 Dec 2020 02:21:53 +0000
Message-ID: <DM6PR11MB4250A66C685D08CC6A7F3770FBCD0@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <20201207182304.GA563366@robh.at.kernel.org>
In-Reply-To: <20201207182304.GA563366@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.176.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 009ec886-f60e-4d32-4ccf-08d89b200758
x-ms-traffictypediagnostic: DM6PR11MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB418684E15F2449546F82AFFAFBCD0@DM6PR11MB4186.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1nvb2DH6gOW2BcF5zQ1eQHTlaDk6lxWbagngg1JnWj9tVCQFjBy3+jbsFpr5YVWP8exG2BlJknDf84rK4ZblD6Pf9q5DzCk6ff1J9y8sMAR9GLSY2wPB4ccit/uJLmr/HGBj+jnj9T0mH5L3QhyxTnPgQStDJtYAY61itYnTjvlUAeWQpiq7wu4tbsDxAHAV7muwmxaqV+QbmGFuhfgo4PbsYj4dUUsCvUKclcbQKoO37Eao3pw6Tu3yAWG6L4LdrcwYN6ncdyFEWXM6u/w21Osil5DJ/vBx0ifD0hoclfwUs5rx+mkDblWdHfWOz+3kEMVI0kPgFw4oVI87zsajg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(5660300002)(9686003)(26005)(478600001)(4744005)(8676002)(71200400001)(66556008)(52536014)(54906003)(66946007)(33656002)(316002)(8936002)(86362001)(55016002)(66446008)(4326008)(2906002)(64756008)(7696005)(6916009)(66476007)(186003)(76116006)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/DAectwbpbbpxF8AqQJIw5j20zm9kvREqgyirW6jFoVMJmJOckl0dLlk+bxz?=
 =?us-ascii?Q?4AIKuEWjmY57v4u7lVFlsAtk1T1KKuaxOHSmQDYE/KvvDKMv2ECIfgvHu82h?=
 =?us-ascii?Q?XAzfyyWdw8w3YNFRskEv+E3Ahu3H0oaZ/kY2+UCkMw/C8zLd7s5uwUYqQTuq?=
 =?us-ascii?Q?jVkAQ36U88PzLgZae6H3W20EZuy7Xq8qCvOJ+i9arj99xMVZBIjMA/QqjEYf?=
 =?us-ascii?Q?FTHDO4GNsZDW13Y09To4OyZQw4k1yFHglsPVj0KbWTzOE6HxaHLKdqFs/rwA?=
 =?us-ascii?Q?JtYJPxshx+xfRA7prfIQ9W30gqzZblhRXKeuZIyHnzavIHc+X8Trv13gU7aZ?=
 =?us-ascii?Q?7/3W/pJyZZf4t+21cLAT+tBB/O8DttDogxtPXYbVEcnyA9s6BI4M/BW5UY2i?=
 =?us-ascii?Q?sI1k+g8GZEGTI+zJ0S2ObcM9Q9htas5XLTcOzEyub7fRBWPbP1empNPDcsnv?=
 =?us-ascii?Q?tc27yYHyYauJJEdLi0ITcypHCa2xbZ6jbHGz3QS/rmwyH/puoE+01vbhcpqI?=
 =?us-ascii?Q?JSZ8sCR1+FDQfPFunPq9E7CNA1nL1oRye8CIvBC9gEpEse4QpeGzYlYemlzW?=
 =?us-ascii?Q?3rjnQGyvFcJPZqmwWQ+CH0O2No041Keg6anu4ekCGZDAr0s0nrPWDm+mK28h?=
 =?us-ascii?Q?3Y6TlOASKZV3m9TESrbHaCtKo9gg1KMd1fE1DuJI08kRi9OfuppND6W7JjQv?=
 =?us-ascii?Q?Pkh6TYQRYKdlKY+rQZnWmB3za3k2icXaeQq7ubg+lnwAzB7DbthH/eBFsUVk?=
 =?us-ascii?Q?jDg6uLn2yHJOL1J+jwjAkm3R/TuZ0cgMAToJdvLkGStvVAcR6XPQi5mr1M/+?=
 =?us-ascii?Q?UiNr2QgAU5mlRjFF50sIlCYTdY0imIhssGDyq25dbl7J5E4jFLil0m6VQQjm?=
 =?us-ascii?Q?rZW5dEnZYG3+h2E7j+SvtmepNKF7y5uvh2LasELtSSfneXxBrpmRT3qpwf+H?=
 =?us-ascii?Q?0iAT54C53WcDTR3DGKhXOnSp1Ha3VRtwAJzVlXIPDTE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009ec886-f60e-4d32-4ccf-08d89b200758
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 02:21:53.5702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHmJoFgkeZ9SqaFw2WLWUtsdktESQmpC2mdUZynj87EHXlI4wmt7iczNwRCtdVRzCrXtsmmcsA/8N4cWUq94b1LAbxb+5npuMNG3LUciRTCcuA+v0W0g26r1ySMa5YpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4186
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,

> From: Rob Herring <robh@kernel.org>
>=20
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
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.

Sure. It is my mistake. I will add your tag, when posting the next version.

Thanks,
Vijay
