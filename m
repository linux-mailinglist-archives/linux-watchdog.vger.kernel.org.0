Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204E22F493E
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Jan 2021 12:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbhAMLAS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Jan 2021 06:00:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:52427 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727372AbhAMLAR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Jan 2021 06:00:17 -0500
IronPort-SDR: BMglsmUGbXpjFntavJbk8hnNU70uoh8wvGYrF60Rs1+5jwIiuEx9QG5ghGnhKEllO2sIosZwvx
 h5ThbnpP0WSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="196822760"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="196822760"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 02:59:35 -0800
IronPort-SDR: t+q0K0OKRC9vpBoA/tRazE+cjY/+rrWNTbN1XHlWgcPl9gxnKJE+oAf35wThBtizL+f1h/yL1+
 AoWv4lEluoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="352172936"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2021 02:59:35 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Jan 2021 02:59:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 13 Jan 2021 02:59:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 13 Jan 2021 02:59:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJd260e+ghcc8kGu+qGYImq63aYvBSuWLQW5Lr7lKflsfhNDOHfxQREsXZ+cBMpES+dqd6kRk3hzk93KJCJGVmpkPdFClqYKqFUdG5xRC4Rjm32H21gNuiXppHgFUelzHHtd+qfnJ6nTCvl2jzRt6MtNXkEeR66eH8RUQndDlmXDmWcvJ2DT9UlmEq3z1jc7nuQSOR+ihn/bs1gWbkez/Xl+jrxHXGr6bNetbgdXPZPeXWIGEKTSYGSguEQkhyK5m6f15MKXhdA+8mGBxqBCtBTIMcqZPEqhKNjT9Qkvkv510k9qVYFALJwLMlI+bMqnFuqbYmEZIjpMuMuNp/qRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKXob9aTQt0NbxSAOEpBQxvdPuUs7JmGdb7FaZoCOG4=;
 b=ONfGZ3+XHkgBI0HPNiCPqfB5g3/98EjKdnYsZgI+aIyeFtwUd331zPZ5QfPvRGA7EdiNmbdwHG7VoFFuve3aQt8cUvKbW4pur58m4saBqUwGYmTqD05LsCdFohYmyev5WKDXta52IodTJFRFVrPvFAlIMAp/ShgV3q+81goQwWOtv0Td7RmEle7k0IirogPMaeB35OQ2GCZa2evsQClsX2Y3HNXtYo394iu3yUa3ng76IriSDXIKoWI7Yt4G8aJLr9dbkMB9f32q2jRoh2Ilaj79QTORW9PA7tUHNEmDtmIfdaVpCrhfzqlgEGeTb7tzwauSQ8u0UrlBiVDDPbJfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKXob9aTQt0NbxSAOEpBQxvdPuUs7JmGdb7FaZoCOG4=;
 b=qdVRc36bnGoZkDuzOrieaf3gS/7q1scHq6aVjPJzc188y1stDfCj+8Kf+tJTp4fekEU9BPcdBbu5uFjmcfGIPg15C0jLX2EA2WYVZ8FqHOHWV1Yjr93PV5hctF51z7mF+OlOzzgsOoEMGYyxMCWGGbApjt7zUfzyRV+njRIYaTc=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB2730.namprd11.prod.outlook.com (2603:10b6:5:c7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 10:59:31 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::6da6:c2ee:aa4a:d21f%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 10:59:31 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Seow, Chen Yong" <chen.yong.seow@intel.com>
Subject: RE: [PATCH v4 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Topic: [PATCH v4 0/2] Add drivers for Intel Keem Bay SoC watchdog
Thread-Index: AQHW09gGEECAwQGck0ygFmf5JftxTKoljaaw
Date:   Wed, 13 Jan 2021 10:59:31 +0000
Message-ID: <DM6PR11MB42506A488FD9A54BAD3824CCFBA90@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
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
x-originating-ip: [42.106.177.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45e94732-d4d0-4181-0dd5-08d8b7b24e4d
x-ms-traffictypediagnostic: DM6PR11MB2730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB273001347EFAB840F830C6B1FBA90@DM6PR11MB2730.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a3FOUEhG1sRq+RhwfsDRZ3Z6pvTYK/LhTq8HflvsFR0K3RuGPcvxJ1PX7Z1b/yPb/oA71Rp6OsC/q3h3sIhrvPMs7IPIxvtDKGWjlrfYqtRGBS28fY6dTtuFnMMKhcItw+0zaQ7aTOtWtG632WAjsQPpLW/NDfubqMS/NG7vGCP2xNwn9g0hRV/apLTveBmJ7FWRdGPQR2A8lKEdzgG90AbGA1cNGyqQlK+5mtC6ycJM2NNeYrnDFwob9xU3aoDMXlZkkN/mMSCinDJ4T29ve4DAXmL4SepSJom1VlyxNDFJWz+McMdEh/u+TyavqTekN9hV7srQGnz6jLuF2Ov36bKgw+FGfcybBEy+EEfAtoh5syOxjMcY8CKFNVbrYrKgr9IaqR+xzKd2f9mSaHpteA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(5660300002)(8676002)(55016002)(54906003)(316002)(26005)(7696005)(52536014)(2906002)(478600001)(186003)(110136005)(4326008)(86362001)(66476007)(66446008)(66556008)(83380400001)(64756008)(33656002)(76116006)(66946007)(8936002)(9686003)(71200400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?o/4UkK7rxxWnwO1L4y1KXfEm4FUzA6D0yQDCiqkbEMv8Qj4RhoaY50FPV6rD?=
 =?us-ascii?Q?cZLJhWvUuDMWOQQzzk5vNdlPhv7hJd9Q2VG3/fcXqSeHjr7Dx3WETjvxLf51?=
 =?us-ascii?Q?C4IIU+nUwPZlrB1o6P+PpZe2W1Cwi7hJSnjBk3iB4yu8MeJfGQYQK76CkhSs?=
 =?us-ascii?Q?uoVV2TvWeAt/VjNfapBTxheuZKp18JDN0bN+5kQ34dn/L/MakTUlQHNB12LA?=
 =?us-ascii?Q?nh6dyr+Kpsxn9V852+c2WO9/cURthJyPKCJKrSHmRdDOZrpxc3ESQB7dRZ4t?=
 =?us-ascii?Q?S2Af76Efn0UE30edENZ+hLMuphtXIaOLBVNGKj5Ejj311IRFOzc/JJ3hZPZ4?=
 =?us-ascii?Q?X0kDrfT4C+n8MTioQToCR1UBuovLcqmqdEZ/YPkTBHIgb9+iEBKWZ5Cd2xfb?=
 =?us-ascii?Q?5hYeAGwISM32ye4KapInJF+p0RvgMn0Rlp9SR0d57OnxPOcHyyCXsU7cp0nZ?=
 =?us-ascii?Q?vAmnOukCNUB9zLfd80e2Ww0Gi1xJ8rxfxnRZqmkoz5KQwiFmIbrpZDY+Qf2c?=
 =?us-ascii?Q?0ymiNG4YnYPYx4B1O3Fs3jsPKI5rGC+omYzlsXrRQCVYVCjw8ZokieZTBOTX?=
 =?us-ascii?Q?nn3Gjgf7RgMy3NDXkGohmZOs5B8fJFugoCy9YiE4E6yO0H2sQ0kQst/rT5Sl?=
 =?us-ascii?Q?GKFLrifuUCuQKeN9SBjgaRB42KekSq5HJBvmnXwvbVVpDOCbIPsW8ixFCeal?=
 =?us-ascii?Q?UwoqbTzqrRwhrJIPvs4TA2cITnN3O5cJ5pTXGVcjC0lSvF9TJjyOh0xhnj4/?=
 =?us-ascii?Q?D5IFVER20H66iMsaHY6TlOalw7U4Ov/QDGWvXF/hcQjVFeUsebsx/xwy+0on?=
 =?us-ascii?Q?0QlNhCTUh5jiHeG0JyETpDHdP4f9EHU1F/z/G4FSG4herV/6jWcAgXWqA2Zs?=
 =?us-ascii?Q?UdjEkasMDwqdEO4vgt4b1GTZ17L9fOEMwXoYxWR3OOOye1Gwj0uOdTA7o93x?=
 =?us-ascii?Q?VqsPCcRMxn3iBq9xjblv1tVxxughTJQxUlMHk8VLoLU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e94732-d4d0-4181-0dd5-08d8b7b24e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 10:59:31.8179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZswAGeZm7SMSlYNm2UZNuSujQBiwmSvtN2ou2hwsg7zl5oKBgtQSGhoY15KCtcHPBjRu8uBEyPKz7BmIvxsMmMsY+VsAhpT5IwM7ZnUWfLU+xkRgdTa9lNQP16ziXhNl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2730
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
>=20
> Changes since v3:
>  - Fix pretimeout clear, when user attempt in the below sequence.
> 	- set pretimeout
> 	- clear pretimeout
> 	- set timeout to some other value
>  - Cleanup the ping variable usage in the driver.
>  - Add keembay_wdt_set_timeout_reg function.
>  - Cleanup the keembay_wdt_th_isr function.
>  - Rebase the driver with 5.10-rc7 tag.
>=20

Kindly help us to review this updated patch(v4) set.

Thanks,
Vijay

> Changes since v2:
>  - Remove reduntant write to TIM_WATCHDOG as per Guenter.
>  - Rebase the driver with 5.10-rc5 tag.
>=20
> Changes since v1:
>  - Fix indentation error in the dt-bindings file.
>  - Use true/false in the second arg of keembay_wdt_set_timeout_reg().
>  - Fix the watchdog start sequence.
>  - Avoid reduntant timeout register setting.
>  - Remove min usage to find actual time at keembay_wdt_set_timeout().
>  - Remove timeout configuration boundary check at
>    keembay_wdt_set_pretimeout().
>  - Use devm_watchdog_register_device() for wdt registration, which
>    eventually supports driver unload functionality as well.
>=20
