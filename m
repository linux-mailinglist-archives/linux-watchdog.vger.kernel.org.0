Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E422A3175
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 18:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgKBRZr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 12:25:47 -0500
Received: from mga01.intel.com ([192.55.52.88]:20261 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727410AbgKBRZr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 12:25:47 -0500
IronPort-SDR: GiP/vzp+VomXMxcTICfTqOpVLdRn21M+7UmfYEZY4uYB/T30iVEs8DaaXL6DGq9ZL9+91KWYS6
 NdnOyLn+wFNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="186757476"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="186757476"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 09:25:46 -0800
IronPort-SDR: 34kqsgbSH63uyX3feinqVC2RhxjwYJ/PybE7fKhCEZ/qvUpo4UZmsGeK/uRSPwznhEL6CtSLYo
 mk1MaddBOp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="426047280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2020 09:25:46 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 09:25:45 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 09:25:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Nov 2020 09:25:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 2 Nov 2020 09:25:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwoZ6NXKhonMWzIUisOalc+2ilE3o73jrADjdhSv/l1s3u1Apkbyunfd5OiFzz1Ts/Hy1p0DgBzsP6NYPyKY6TOh0BCMFmZAqmpcyeBM4kUTCGYFEUi+7Zja+eW4WbKzpRJMKRRexBhqUWKGB6LTDY362OfqAkANHAuBFyVwT9703GurBp9xcOfYDkOqJmi08p7GuiPrbGVmyL8FVZximdjMzWQ+bS2OOW70V3QGA8DcISybq65aaJ9oig7Wdsamy/6GvrJOeq8Yy6YwvaOqzDwgEwX2E1BnGu74NvMVfsFCykw75qftyeZntrdpMMhTyiSKzWl1b11VQssakBNb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D8uSB3JIXQoJbVRlkSbRZoVeLK0H4uVzUSpKkofeD0=;
 b=HFPizkh7ReeZi5Tvt8qam9Xv7VZctSI9ensr3R/bezqCfnqTxKUsSUVBNDbTnlf/cpz2hF5obB0JLs22EWj9z/zueBCRzWsr4XXsWqwgtrc93UzzsD+COSpViFmKsptHRexLXKpMRQD63fn3uWIVvi8qyvWJfgu6Oq3nnPCPnLrYITr3ytlCMplzdEoYbUDZXvHauOVMqyROEFXCUUM2iebEbd1xo0cAsUWLufn4trnPbSmIT/k65ywUfo9UsS9lWXIIYOfg6dsJ1uwDdUCHUsWRasM/qXHQtLBy0AOVp+dB7oWylIDwmQFx4ZI7Nu40FcE7ObWya4sOBk2J7HuhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D8uSB3JIXQoJbVRlkSbRZoVeLK0H4uVzUSpKkofeD0=;
 b=x5vXFJf1/FNMnFLRunLYJ469he02I6yhbqJRQN57RmOIA4I74KeW0LX0glqoajx/qY49xxaBTsjnJqjYujGIj3nlqHXqEct+MJr27dtggd2N7E34BqMoJfanMfUbqCTljDXRSGuiHbdp4zxaYuV+cbJ/RFg1iH/Wiq19Fl0LmPQ=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB4489.namprd11.prod.outlook.com (2603:10b6:5:203::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 17:25:44 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::7448:c067:e80d:3c09]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::7448:c067:e80d:3c09%3]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 17:25:44 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Rob Herring <robh@kernel.org>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v1 2/2] dt-bindings: watchdog: Add bindings for Intel Keem
 Bay SoC
Thread-Topic: [PATCH v1 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Thread-Index: AQHWsNXEs0FxobkgBUiQ+xU+GKKDoqm1F+YAgAAAV+A=
Date:   Mon, 2 Nov 2020 17:25:44 +0000
Message-ID: <DM6PR11MB4250C7B3F50BC5EBE3BCEB32FB100@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
 <3aa5d9e2031b4646b7f0c9831f4ea9cafffb2691.1604292525.git.vijayakannan.ayyathurai@intel.com>
 <20201102172248.GB4073001@bogus>
In-Reply-To: <20201102172248.GB4073001@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.176.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cae3657-aec7-4415-f2cc-08d87f54546d
x-ms-traffictypediagnostic: DM6PR11MB4489:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4489161B872980114762590BFB100@DM6PR11MB4489.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TjkFh/Rd3OoyLahXQFa83qgIlZQa/iw6/Xd7fHUN2TxZc66Z9zF8530u93MrEZvFi336iUpt3YE6q3N/KS9pKrIPl+KiwRZMu/Yy1ApSaxq9E1SXiHvIH1Bu6eO7aFWwCh8rI/TpWRJnmv6i9JV35cykWMEFk2p72pTPfDir67JziUmiqxtxcQ0cAWYjF2LmkR19p5HlUNMsxjEYZkNHDvZVojiqMMsCAsigaIeYD7KBnGN+0sk5P5UT1foR0HMH80PZsEm2JjcfcsLTi4XLkO8KN0q2bk573fidMq8HS7EjEuA2+qwubvMCNii+/qeBYHbAwovnNTGaf//85WhUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(2906002)(5660300002)(26005)(478600001)(71200400001)(6916009)(66476007)(66556008)(66946007)(64756008)(66446008)(316002)(76116006)(186003)(54906003)(8676002)(8936002)(33656002)(86362001)(55016002)(7696005)(9686003)(4744005)(52536014)(53546011)(4326008)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hHsBHE8TMEURoCr5tz3fGlV+wIQ6gcHsUaK1D7jY7myI+Af4IcKifiCSEXEt1y2gCqHGaLEqEaehYDwBt60eggzgt5kzJGWwU5MeS2vUuu8chqeswj6b4HcVam87COGJpKNk0dhJlFZ/arAgHWzkUlZ9Uvd4CmY5GMcN5/8fFhZti8/2PUmn5kKtJI7XyRrRFm/6jBbZXN1inOL6fcCMBwu8zz2fYbSuYenpB/Z8lPMpibl0hnzYk6aeGqGXohvS9N8DyFwd0nSX9Z7t0pjt1kH/t2PXcQdgVMBI2bmuVDU+Ve1ztdwOKm/81PLy5PTavAaNwL2AsS78Y5D57k+q/xShnM62VT54uEKP+VjoYe4AYzE+DXJsaP64aRQOuygRKBCnNb/2+v4XS4E5rj1R/0gzv19oLdQRwdpfZNc+GqBh3akCBPr2SpDYTCyzXy83q3ix5aeKFzzUPzrfDZEo+I24TV2A1nFEtUaqlowKqWKl6sdmSe+2rIg4UczWCPq8X49TJvVEg1FaCaBO4JUqU+vFcj4X+fDYhXOOkWqPXv4Qy35BrPf1yzLwcdOAGn26JQkm4VIAuy6Y2a4tRP+sSGcWqJ0B0Q62mm7EwAgNz4sT0PAzKAAs1HkE6x0Ln5p0bV7GaAMU5RZrDueDNjVFGQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cae3657-aec7-4415-f2cc-08d87f54546d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 17:25:44.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQwfPOv/WCi2hjwpL/AAOHwkdvae2glLWUOPwZtafcIqVSvrngMS0V7FmpaDVkpD1vGPTIL9+EkbjJFRJ3ieSe96ftRk8Nbz3q24WJqO5jTCyCPFAxdsvSvxmxEwad/W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4489
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,

> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, 3 November, 2020 1:23 AM
> Subject: Re: [PATCH v1 2/2] dt-bindings: watchdog: Add bindings for Intel
> Keem Bay SoC
>=20
> On Mon, Nov 02, 2020 at 01:23:12PM +0800,
> vijayakannan.ayyathurai@intel.com wrote:
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
>=20
> With the indentation fixed,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you for reviewing this patch. I will fix the indentation error in the=
 next version.

Thanks,
Vijay
