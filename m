Return-Path: <linux-watchdog+bounces-3643-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB192AD053F
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 17:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5DCA172FC8
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 15:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05266288C93;
	Fri,  6 Jun 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I8Eo/SWS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E619A17C219;
	Fri,  6 Jun 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224068; cv=fail; b=PQkDV2T9Vh598MAUeg45VEQJvv7HRQ2aJ+XYOhSsZMemmO3mcelkvXV5/YwfZqTE4MLFup8nP9MGK7Kdh8QV/XKc3TL1QaB5h5ZGlYPLJOgCyeIcArdYyaBUWIWAhEMhHqwJkAqm004nhcfVLsl7It24VbFQ5VuTU4ePrYGG91Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224068; c=relaxed/simple;
	bh=J4QfwvPt5J9RaY8MchxndM52ueJ4XG0G/WwUxYQGJqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ip1svxYko3baCErUDSIdwRFrE5gKDc0+KPqHMJZdrtglvoFQz/9FWr+2SZnXiyF8x5kEcNDT3JwObvY6eZqXZLNVwPcnFYPLmbCH7OnvgCq2fGFBq420NHTz6q98KzGHLGqnHonZ70ufX/SYodv1F+g3rYpq4aArRJuXgB7aAps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I8Eo/SWS; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVMkHrWv0G1xo4NfA1tbwJde+jsPWuvAdFchaGMebU9mbmqUGyCmESN1PQ+kG8HmooRGVu3qAD4fqMUBd4oRjNuKR+JjBzqBAiD+w6bsd+0FHuaaWGPqxVF3bAAaSxnyY6NAT/S6k8l3+wocDteDC4+8U8J5so/bB1FjVIuCBXqU102CvBFItIe14scxtt7on0NSa8Plk50zSKYHpULZ3/NbAXaWhrn+L6deiu692FPH+gKD02e6jFoWblS7dq4C9c3jXL6llvSbXSGg0OzjwFBm4WJHqJtfRU97vWvkkILeZUe8rQF0h5Ou9+s+NGWLsIdVn6i+7xN/22yej/DvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoti0JNR92Z9hgLFLl3Ml28qUOFEOHa97B+FeEwr5aU=;
 b=Rt1lVzVspuTcYTMyAD1kZwfttsBhB1vOTMr2yoGVKhRFDtce/vfnQ5SIV34x9EuyTNs+fm+NzkZkdzX9m4Gn2R7Bq5lm6HNnTnlAa0+ifhYEVMHPA2YqIhSPKkLxw1kFmzb0kvaQviKMCevbxdmY23RVZdJfAmfLAV30LAmimp1xXl4Bwc7JJWXQeaI5lUZtgkUygRvPl3dwDb8BkL0vbfcEJvdHBGSgu+cmmqRiFh6wUKckPQEwhxLsRvJYGFLVH0MDFenSrf9rw81F+RqYlcJdh7dphvKGglU8Z3lOoSYsahy3KDwLIDRKQyW0J5FreefaKZakRDsDDUCYjey85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoti0JNR92Z9hgLFLl3Ml28qUOFEOHa97B+FeEwr5aU=;
 b=I8Eo/SWSbYHEFw/BjzEraOsc88U1CmJippKNf7OpvbqvFjSFT8BGJYn+n1iGq0QyjNsF4iECR1AkfNWY96HxkvP9HVuF/MfRPlQrfV60VEiS3Oy9/+AeU57QL1MDyQ1IhkihL1xjjYKTDysI6LHsOLRVDREj+/GA+6EGceK3D3057BlBF21Qjk0bKBCd3DQoRGayKdWpvknEG4TyaqGikAMPWdqMtAdCOZv4xR66XtI514swGzoGRXtlS4x6RoUPKlbVqz4+uMZISDiMsx/iwpUXD+to6xvlFENa/+5MNCH7Qs+YzWZ5kTlki6P0GKj/mjVkN/XJFCQF5JvNqfKWnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8762.eurprd04.prod.outlook.com (2603:10a6:20b:409::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Fri, 6 Jun
 2025 15:34:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 15:34:23 +0000
Date: Fri, 6 Jun 2025 11:34:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Message-ID: <aEMKeMaka8yLtMEc@lizhi-Precision-Tower-5810>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <CH3PR11MB8773488D4C9E9C7A9D44DBF9F16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8773488D4C9E9C7A9D44DBF9F16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
X-ClientProxiedBy: PH8PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:510:23c::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: e751f061-1fa2-4f80-8624-08dda50f9cdf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?+zZigXTP/ZhqgKLUORLqdg2sl6zD9m/LK4TJtp+JtDixmw2OQEaOblsSAFxp?=
 =?us-ascii?Q?ODLHtiEaUy3Dt8LbHGDNM7F+iEKIXkZL6MIMpq6ETMlSRySFGKGvkbPiMXeq?=
 =?us-ascii?Q?dQEntThr3E/bgTDN1CH0WjiSJ2ybmP5Jpomlv99ZgWtqGMCXgId3hSkEWuGn?=
 =?us-ascii?Q?jsjfZqkvRTZTswbC6FS9AfxuIHfOfsTDtLQ24/WUinCz2Cqe9Is1N+LGx7/h?=
 =?us-ascii?Q?hWlu8YP1OoyLZosg7ErJl5qxfRxSkEDJ2QIBniXsl4TSP5Aa9N00YWoMB1ZD?=
 =?us-ascii?Q?J35IserEi40fOQcZk/jaJi80z5J5JoyXaSPHQyFEZ5xz9BsQOeBwJhwOt8EN?=
 =?us-ascii?Q?tQnLQGFbDwBPfn5WVSJITui4SI0pbXy2lfECSa+kR6jPuqdFTdpSI9BDx4lM?=
 =?us-ascii?Q?Jwz2VLYPQAkjEOVpYiV88qtbw4USI/dBEdE5wWH9xDq2ETfT4KDYmV4RjWGO?=
 =?us-ascii?Q?iQY81ZfuydiiQIeUrk0yOPMo2IoCWlcj08oDuVj5bDQDrn8HVZwspvzCGNLb?=
 =?us-ascii?Q?tE3pVrV3uCBU6nmnEp4986nlt83XAN6iVkU361rxO/b2Nas08gaxGTotGaWZ?=
 =?us-ascii?Q?0wyRYJi/Y2NpMXiOll/An5p4cxgfTWLY9DpzmfPKf1T1bEC6HzYc9IMUCGxQ?=
 =?us-ascii?Q?SIM9A4xatPK7Xt8I002NAu0ZSRsKY9F2p9WK2Utgg4EKjcCSjke3g4/noVXt?=
 =?us-ascii?Q?RDSYHk6/4L6xn4ANeli2imH41v4miqrmLJ+Yzlupi6xAoX8baN3Fgp2SjK/I?=
 =?us-ascii?Q?nHGMMQAozaEAE3CFsLkIMFMks59xWOM7ypR6xSsbYMODVfmJGTx15OEJxBpo?=
 =?us-ascii?Q?272NplKF2HEuBnBc7+GSw/2JAARCgZxNILskM7HdB6SNWoB8SR5Rj7Lm9Cse?=
 =?us-ascii?Q?uMpfMOu5oIGBoxAkHMXjPy0xLcgCWtEhm6Vpi1Gd3+n3CmDYrmjP+aTLgAW5?=
 =?us-ascii?Q?EG1A31BonSEXaujNEsPJIh4CKExCN68B+Dqze716VRy3xAxBrlm2oS5vaZ/D?=
 =?us-ascii?Q?MJfEcgRjJf+ufX3tLziUQ9uVU+9nrccGkkEJ5+VrrwGwoiiS3HEVkoml5IQ0?=
 =?us-ascii?Q?RwgOfZtvX0Fgtmv1ua5Nq8f2GJFKvqSFcG/1vjKwl2XginMWLVkBZQiSEXUX?=
 =?us-ascii?Q?fWIq8He50i99cd58RZbt+CcivY3fuv4ZGmD0yqPBJrd7asrvPgUDINLmlD2n?=
 =?us-ascii?Q?YMJ0Z+cgdOnDpn6bIK+eTHj5nWvaIWO1IIX742lXbdX13TReasZlE4dikvAL?=
 =?us-ascii?Q?iziafz7orb0xmrQuMBeI1a83742iWbH9U53yfiljWFJVduVit+kTF6jtt9as?=
 =?us-ascii?Q?F1ks7TmvkXbak4mBGwhS3Drk0yDjjaeQAc1KicI4gWSUrry91IWXTrYqq1aV?=
 =?us-ascii?Q?vHCNsIEC60x5AfQWZisQpmX2IdChD9zUBdyZQI/kh2Fn984oCaa2PG3UsQxj?=
 =?us-ascii?Q?vIJpwBjKBmwRB9Kd7SFaxQpjt6pgwISft+kDILRvcai3wVrXFvvxZDVnMOhg?=
 =?us-ascii?Q?KQPqSvDM/DyABXo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FKQ7MUU6hLCY5ImdIVkpzHoV6Re/GHOVpD7d6QR5Gi593m1ouaIGqh2pcAkM?=
 =?us-ascii?Q?oO9+cufZsovVVMZ22Ry+XuhEh8BwgtnqlrN74NYAC7QTiSAsBVRkVSeDEsnl?=
 =?us-ascii?Q?Y6Qgv+0cCc6vtFwRrTZLeOtB8bfLwlK/t/j+3jkB5KmmuqZP9LMl+/yOBRA4?=
 =?us-ascii?Q?PiN9IWr+djQiBW0/sb4xoBc2ZCKL3+ShmXIttU9jWfY6W9oL8CraLYamZ2VW?=
 =?us-ascii?Q?rh61VVAO010IrZLP8DLe5Jg8Dcf1RFifOjXkSL6O5N6OMAuFDCWzvU0GtsWp?=
 =?us-ascii?Q?oMGWhkCmanCYUgxxnuK8jeE/v/fMuxYDo+YmWdrGQfuRFgtr/9lc/zf7qHnX?=
 =?us-ascii?Q?vJwT+NL/u/BzkFOtZ9/Mj49K7N4mlEApdCu0xHFK1Gbdq38/5MdJL+arSmZ3?=
 =?us-ascii?Q?kpc61OT6RxxNsrIpi9cNvGxd3hfWuC9l1cZQkKiO+cprjYqP5YIquiod6e/B?=
 =?us-ascii?Q?i4xNzHoG6SMLMK5B0zfVWm+5ddlTeU3F2XaFXYuRgZbBjm9ApEOfzHLA2AK4?=
 =?us-ascii?Q?S5dzUTu29yjLND+zM0z6NbM8H/HPWhTvOxN8PZ0vtg2On8F7KqDw9aUvX3C4?=
 =?us-ascii?Q?Mfl7rDn/Sotkkz5+dd3Xxk19lDsrt0INETB+te5gPsv/F9ixxIfvYir07kWt?=
 =?us-ascii?Q?XFB1KA+0yh1hJKE8O0fc6vaORWvabAPaFBPsB6skLWF7NCskpgKT7UZSHl56?=
 =?us-ascii?Q?k6+Sfd8Z6x64/m5LG1cMx1BrykivSeZm0NPDeKjB2OrAiXCw4CakOEkA9Qnv?=
 =?us-ascii?Q?hj3C+QMkyFeAH/6WHWtJIf+Xw0LSUCuUkIx1oSwdm2mY4CHzyINASyueaHxf?=
 =?us-ascii?Q?AAvV+cMSO0GWbbvaIONdlSUvJKnQiHKotSRP9x/1ATidbbIFBKJ6PIV0lLcc?=
 =?us-ascii?Q?/Et2A4CRBJRUvrxX6nBRFBO3dTqG/fyfM/8Qk7gvCgg5jwTNK80WavHhBKD8?=
 =?us-ascii?Q?oQfXyn7PgrINjWfaoF2K+0HhYTBBxqVvr43KFZ5x/piN4JrNFRFF+skkUo0h?=
 =?us-ascii?Q?Trl2mQ8EIsXTMvne7irEkdgvxZG4SKBu1Ah5yp+etbkcaF6J++J31aCjJQBb?=
 =?us-ascii?Q?dYDlLp48I7z9Hlkmnm5LWP8hYzk+jOe9O4qAG9pMIVUpB+hInoM3G/D8cVYl?=
 =?us-ascii?Q?NojVQfzLq/AQXREn3UgnI//fEQ+qJ4nQQgRWcgriuKSOgqc/8LgAOKkJTHdx?=
 =?us-ascii?Q?+gsI1iqsd4GYF8OCvrG3mEESIHpiftFD7B2b9Ws059TYUcmmV/dLeOL5FdEV?=
 =?us-ascii?Q?Sn/EdFgeTzzbDwb4z2e41iNGOAey61vNCoBfHEIorKOuZlAttKx4NxkXFO85?=
 =?us-ascii?Q?o6qCRVQ1Sdfq+guq16l8IGgzn2Q70KUqQ78pQ9ptv2LY8Rxd2/xmpfZVqi6a?=
 =?us-ascii?Q?u6a+0LuX2ZjrcOqZdViIpK1CAosthKwqpK/DoV8tC5kWYo6GJYCNQNEiV4j2?=
 =?us-ascii?Q?ksK1Auk7emz4PzmWluvZ0zETYdhwRlh4fSmedgGuKvvLnYJQk78Yxa1cJOjy?=
 =?us-ascii?Q?BvtuL9aGkE8J9NqNUX8gkkQjxuYzANqWDDiw9JQjZv/XB3DYIfTYAv5cJ8fM?=
 =?us-ascii?Q?MYCsVXAdjzjzT6R6kjI2EarfHNE/7TjhApb20T2U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e751f061-1fa2-4f80-8624-08dda50f9cdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:34:23.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRE70GJ99DSBQiLVB8a9zctqso+kE1zJNeBqBz7TNJPjMGlfhOGIuiUk03covv+icKrzZgX2o0AVTqZtJFmNTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8762

On Fri, Jun 06, 2025 at 01:46:56AM +0000, Li, Meng wrote:
> Add watchdog binding maintainer for the patch-0001.

You may need resend whole patches, which included linux-watchdog, they may
use patchwork to track patches and miss this one.

Frank

>
> Thanks,
> Limeng
>
> > -----Original Message-----
> > From: Li, Meng <Meng.Li@windriver.com>
> > Sent: Wednesday, June 4, 2025 11:43 AM
> > To: linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > linux-watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> > robh@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com
> > Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Li, Meng <Meng.Li@windriver.com>
> > Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
> > feature
> >
> > v4:
> >  - Improve commit log of patch0002
> >
> > v3:
> >  - merge patch 0002 into patch 0001
> >  - improve the commit log of patches
> >
> > v2:
> >  - improve the commit log of patch 0001
> >  - add another 2 patches to fix below warning
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb:
> > watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow
> > True
> >
> > v1:
> >  - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-
> > wat.patch
> >
> > Meng Li (2):
> >   dt-bindings: watchdog: fsl-imx-wdt: add compatible string
> >     fsl,ls1046a-wdt
> >   arch: arm64: dts: add big-endian property back into watchdog node
> >
> >  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > --
> > 2.34.1
>

