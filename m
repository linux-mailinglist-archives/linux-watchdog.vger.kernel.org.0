Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458672CA74E
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 16:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389636AbgLAPmV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 10:42:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:61189 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389443AbgLAPmV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 10:42:21 -0500
IronPort-SDR: JivhYQtM4rvMDlAgfuzDH6JT4QUnXKOwhMEqE2cOnRN8SGyscDdtUZckSsfOmOp2V7+BPk5Dlk
 yYu6jQssydHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152100625"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="152100625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:41:40 -0800
IronPort-SDR: LcgkthKaw9Y91+rxGt4s6eSJ6h0ol1ZZ3QABe7pD+VMgguT9TlrEbv8ybZQK05oTKR+zlshSn2
 Cjk6Gc017aXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="537572721"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2020 07:41:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 07:41:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Dec 2020 07:41:39 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.50) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Dec 2020 07:41:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpkQLeAXtuetqyh6a+9+1vQz62Vhj905EIEYeEw3XRaJXG8gEJ2w+VcA9V6Yr0pJpLkxJrCCr4Spjqf7fS7813UPGdt6iBeNz13ZJnSQowYfQnctuXZpBVekLX9+3P6vBF9546BuAvHZhNeBZlD7YSGK3uKft73p7mnbfP9rHfEeaghDht+2CcW1w4Vu2gHU5Gmn57GBDxMFkJ3Sx6CnQggyoC3LZ1wk85iQEOY9sgsBO//ldyMTQ8Whtq4fzPE4bRmDXjiUWGSyz6Eo4roiXaenAey33OHEiOurJjBsv3jmH0JXJmZ2y5GkmbFKnjkjTR90Z8TougcDRrbAjr+YMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqstsU4fvp5VML2iPgWO3yuuuilXQZZmSPNYhT6hSWM=;
 b=EFIzEE4UoqXb4v5dhEy+Wmz/9SeZDjbGGPSYNkpsf2qJ8io0PlYVYBHz4Y0ox7wnU9FNKWFUMO3NsXTeawnmiWzTLlrrsWUnilj6EzD1eRCExxf8zKS4a32T42zzYEAyer3MQeutlLMoP5Lw97hBKR6NQOup1BNf+B5DxPqGfG7LegCwmP43ljGAn/G0Jq9nBQFUBQO3iU+ghvVmpLqKH8buFhvW6F/xD3qhDArRa21+GlJiU31cmf6heibmKu54S3DiuPzT2xMTicCnqBizDpzshJSw1y7Ih62VPBn4bv21H/OcC45sgN5i050EM6Yg3xhIKzyO3o1MJ9LNOGZw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqstsU4fvp5VML2iPgWO3yuuuilXQZZmSPNYhT6hSWM=;
 b=G2SutcWgDHO5bXkmAZlRUt2l/mh3a/foakSKpU40xXL9k0pw0vhZrNUXArtC7qH7j8pMl4unx6uVIdkviA053j7Um/arvzVzsatvNnyfzvBblXogFxgT5NVyeL6FGOsaFIWJokyR/zdUAFwpU9vanzFvhDj4kmFhF1SNifuVuac=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM6PR11MB2825.namprd11.prod.outlook.com (2603:10b6:5:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 15:41:38 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 15:41:38 +0000
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
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel Keem
 Bay SoC
Thread-Topic: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Thread-Index: AQHWx/CMPyJ54KhtzECLIIMtmp7yx6niYKQw
Date:   Tue, 1 Dec 2020 15:41:38 +0000
Message-ID: <DM6PR11MB42502F3008B27BEB7C58E8B9FBF40@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
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
x-originating-ip: [42.106.176.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37b47006-fb85-4cb7-d784-08d8960f9797
x-ms-traffictypediagnostic: DM6PR11MB2825:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2825687D5DF76A764DC7B64CFBF40@DM6PR11MB2825.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HkIy3OMdplemkgLiFry3K3q96N4JthMcewo3lWnO/p9iyJPmNOM33oPb8c1Zx4F8SfKrCszktCvy26BzvlyY398rtvX5dJ0ksOMvdBt/R9i0BqnG8Y9QzkZjTaGeq1xpoBbVDCg63N9+SbyDFCaNebj5rznaW93eDGyn6ZRuL3AJ2nswUcDqEeSqyuuGHPiDOxQ8yqKYPpTcLv+nKm/rKD2YesiN+XC+Jfog4Egs4zTpsr5xYHldfU0w35rSNJh3NY431BVvYvVoIz4qXTAV7clkbxnkM/bhvYOphdYb/Gxc/kNCqnpVRm2wgiqGE4VCP2Nt1aBTtHNtCOMx42Vlbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(8936002)(52536014)(5660300002)(54906003)(33656002)(86362001)(110136005)(8676002)(76116006)(64756008)(186003)(316002)(66446008)(66556008)(66946007)(6506007)(26005)(66476007)(7696005)(478600001)(4744005)(4326008)(55016002)(9686003)(71200400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wTINJ9tOibXz9c8FO8Q1s8zppDEPfp6Em+SBeW0IkEJHPeZvZHZbOBlu4aix?=
 =?us-ascii?Q?zR+2W/Dgs0Vnqi//3mZCBmpP5PSxfEOJ5RI0n4rlX6XF+wSUlHQ1vo1/qn0K?=
 =?us-ascii?Q?qOg7noBYJclOFZlLTnhh+xdM+T7c11IMrDKryxbd7HGUyShqN8LrAKLJEecb?=
 =?us-ascii?Q?PEG95VlFgXcGo9ciZIr8l5Ln24p1y83ppuQ/tDT75w6H7f/5B6nD1Uzt0WxT?=
 =?us-ascii?Q?GY5jsYAOV8AXUodAVmtpCQPuWwBpJ9D8BKvwashbwRD4ePGPnoaTqIcg+BOy?=
 =?us-ascii?Q?836aWyRExd28eKnbTxKkVn6VCHTn2K5iwJB5vW+207IvcW6CWZP+g8lBJh0T?=
 =?us-ascii?Q?nCmhOYisDZR5fphwZXFG69L7gRvd1o+axbaMY0iRkNT3SAmobZRFmXV/Cll0?=
 =?us-ascii?Q?zNNJ4CUiPRqGRVyusAKPm1Y3tuB0RdXf0t44eQvrZkkEkfeOHfjeQoSkJwYT?=
 =?us-ascii?Q?AYvtqztmTDCr3dK4bhmWpEhjPQDOn0LBDY6mVTSnXXkWc5jqnOZP6m1qcTGr?=
 =?us-ascii?Q?KSle9Nx9wcFphc8uW04YX0YCrJBq6SGDaUK7dcYHhD+Xj9LfQVbrne3kiX3W?=
 =?us-ascii?Q?D6cwZ6pmj8xNrZmZXDl3c9aG3zKRwAoeWs0kxeogaatSmHwg1ZoCaxZBtU73?=
 =?us-ascii?Q?UagTeF4TFZ6FXLYQPpS0nWNpvOnvQVznl8o/3Fg691G8ShJMGzOCnVSLILAo?=
 =?us-ascii?Q?xoQWpbM7RvGDKZsE5CrJUMfvJbfKCGbYdu1Zssty8rh3HccWVnT0FM1IqHng?=
 =?us-ascii?Q?STzkLvE+M7AgEWHhQaFSZb+Er5hbl6cMLK68o308bWNtZdx+j+Jy8HpT0mgq?=
 =?us-ascii?Q?neHBAwFK5iLU0OZkbKJuIs7tTXi1fZueeCdIT+E8J6yzktHuz4ENqQJm5b1c?=
 =?us-ascii?Q?TuOMMh8zun89FskoV1lk9ZoCAU1WOtZr4np/RvnFwziN1UsE3uEGYDVru3Dd?=
 =?us-ascii?Q?H1WOlb6RFOvy40dBhCvm0Z+jh9ZKw9Jh6GATOVS4ydY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b47006-fb85-4cb7-d784-08d8960f9797
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 15:41:38.3622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95Ds0Qp6LEAxi4gobed9GWGkWkbgEH7BrAu3n7jLOyvuuSbOWcbWPbdYn62+Ok4P+VO9QkbHEm4oNs2XT9QRi1cNf1APDk+MNSFWo0geHci0FSojaiIBLOfH5xfbX/8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2825
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

> From: Ayyathurai, Vijayakannan <vijayakannan.ayyathurai@intel.com>
>=20
> Add Device Tree binding document for Watchdog IP in the Intel Keem Bay So=
C.
>=20
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com=
>
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sorry, by mistake I missed adding Rob's Reviewed-by: tag.

> ---
>  .../bindings/watchdog/intel,keembay-wdt.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
>
Thanks,
Vijay
