Return-Path: <linux-watchdog+bounces-4315-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35ABB9945
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 18:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 894254E4745
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 16:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B8318FDAF;
	Sun,  5 Oct 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WadAin6Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0FFB67A;
	Sun,  5 Oct 2025 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680461; cv=fail; b=iYQHX8+ktQA1EuDEhOrwqXqNdtQg7yaJrZESNpjrWzDWoB5MUr+wM1xv/1WyU9OyodRHhevKzh9oC/RJ/O8R8yogsqXrUCjLlS6c3bRwvxjJ46CWgYD5T7TrKeyxcfXbN1LSoHK0EOT7SaLqiffpddFunXNkWIisLWk29c8FoGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680461; c=relaxed/simple;
	bh=O7XAlbu45jj0Dy7WIWS2SpeOBBx5bTEr8/trWKl5F8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DFmc8rflgL0kF41ZfGstJapI/gK3YkCGlxs1J1N+nD8AwVsPCDxWo3/uh0YLA7UPd6ZmZMwPt1VvSVpsv7UxRBwyZUCn7RrzoZWHhH78SSHRxRpRncHjW2QO6OcBPKrvW+V8d9PLJ12S15jT3uWDsO6OHHR5XoDMmmFgZHJpDEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WadAin6Z; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a30nqynXm773EXTAaND2sp/Fee34CKEI7yI8bOf3f30VgNdcXXv0Blg0iI3WsvHnasLuKiPzM0JsmzSqe9AiiwCVfHPlYNPBRt2mHtWhVTsLYgyyclm6j1YV1RrYVELeeTfM0SeSEQMBplwCKLG8kwlap4l56Y4C00xq+tf5TMXNh1M8cz0+SeB7HCzcPfGQ+DDQO7Xzru/I9XFjSTbQNFjX/u5+wGIVkEBGAWYDWO/BCChEFAEQr6O2w9rwlGXwEZRTAxO97sos9QG2Si1uoU5MsnTyvSJAsjqVBtvBauHN3HlZe4fsBdfJF8+wgam6UIrcnaPErvnVygjJiThRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Vv9WzxrseTP7is/1CfZ1eiTpF+bsVIQaQ3zesek5rw=;
 b=JMnVAXfPDu17j1E0ndyavbbt1x7Mn9+IAg1AMekFcF6317fZ9XaFMq4ScYltdP0Lgns4gkY16VI8fkS+n+jDbRy8Ky1Y73pgXv7zC+mRheNz85mIEKfev/Wo7W+pDAOvy9Fuqubt7AKyA/2G0nhZVRr9XbhkvHNEyEtaZmMWy49qUhzzrLzv8XdlcwNdS0SO0et6g94r9uIrxE3xmDs0pxWCrOpDGjrpzk5jl2dJSV+aA5Dv5EsRfFDuTEyf1OvKEE6oKpIw529p//jJ8UcQNfk9+Tjn9DteoD6sVUUWg1dih5pOooJkniVu6RoDS1BByzK5EVKt7EKYJ35VpUS6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Vv9WzxrseTP7is/1CfZ1eiTpF+bsVIQaQ3zesek5rw=;
 b=WadAin6Z61D68oXgdWb55vwaco6dla8uQPNbJavSPIz2eaFtnctY4yrKu5bd96siM+vFrYt42btK3RsquRJZ1cWLMZSkix660cnN1TlwNiRt7xU8DqBAQ++Z9Mlnvd++einw6Dz1e3MtOU8DBriE1ciOXYEjDgk0YtuOwUfTDlE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12618.jpnprd01.prod.outlook.com (2603:1096:405:1b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sun, 5 Oct
 2025 16:07:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Sun, 5 Oct 2025
 16:07:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Guenter Roeck
	<linux@roeck-us.net>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Thread-Topic: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Thread-Index: AQHcNgagQ5/85CLbrUmtG4qDdk4zRbSzt7/w
Date: Sun, 5 Oct 2025 16:07:35 +0000
Message-ID:
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12618:EE_
x-ms-office365-filtering-correlation-id: 649c0e03-b35b-4421-50df-08de04294c76
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZdnETe7NHwrFL7cuRtmWtbKHt+Eshnyos3eSxN9XD01w3V77MeBQ+H23YAQ2?=
 =?us-ascii?Q?DVwOWzOcRj/D03k/8wQn7hnE86iz0QFszy23EhLt25xSnXSR7IUHeDGWkrh0?=
 =?us-ascii?Q?HqBHUaZ3nJpg1KgzXi2jNTYLWXRQJp4tLygpqhhMc7A70+qcECeydWjcexHO?=
 =?us-ascii?Q?d158Layj2gLYTOElE7YyyUoP5WsEPYBtD5dlbYazgUQRUNyc2Wf7MiJF1Ab9?=
 =?us-ascii?Q?HyEHy5EwCQfJjk8EL8kKg2XE156PcTRLjA0h1mOAjsLMaFXnhvBa4JSSGLaB?=
 =?us-ascii?Q?Bbu7AQlNHX+KCNbxMEcdJkRaAKB7Q6agVjdS4rLvC/3VSk9BiG4bnddLYAn7?=
 =?us-ascii?Q?9uo5Rt8boSICJxFlXf7wLVF/oz36TdDRRSTxCG/xNC3w45Mp9UxZcD3NOkNZ?=
 =?us-ascii?Q?BP3/XDy0rDgubToprD1mp5nCv1UUy5fzGY9paH5xTdBkxoFKPlfWkEjCWtgr?=
 =?us-ascii?Q?Zy3X+JIgbyWBAo12yQgTSI2lodGtksNxh+hjY9uzpx2GtlUfnEQALtbA/VNU?=
 =?us-ascii?Q?G8tbmsfoYejf8qwase5dckjV8OJv5vZe54B2swVzTevIfSp0ULA48DzmgpBd?=
 =?us-ascii?Q?tXn6yqlI98dVAf/zdZg009MEYseRlgCNkbs6BnjDmbV9o+IOVLfY0y8nYncH?=
 =?us-ascii?Q?3zp/ebi6OyayMYgkLZSCOEQ+X9McxbLrwDBsBpdn2s4VyIaG39D9L1CVRHwK?=
 =?us-ascii?Q?74h9FSYm71EMl7If/+PjIqmz8U2S6D7WU8xRfQ1IccUXGMG8qYjmab+G6k+T?=
 =?us-ascii?Q?n3Og9yfsPbAHYrpC+NtmlRGc97W6YtQoW3hX+PnLZx8ixTIAWyBB+oD4ByFV?=
 =?us-ascii?Q?EbFNRLPgrNyoQxk8VFERoQe+TJf0hln2/XP9Ue/NscEzHBvSeh60LMLBoaT7?=
 =?us-ascii?Q?S5WSiQqX4BfvXNdC20BYJ9iNd0nb1+x8clKX15JkGkGTiwI/xWveHWGnbhqe?=
 =?us-ascii?Q?D942zUTaGlW5CWVZI1GSZPhJGEkAkvtIUrqaHt1k5jXJNMjjTZvt6SW5P7n1?=
 =?us-ascii?Q?mpKqu0G6ZJq15T+YgnfudP80SzndijUi2h64qD24yP1dsHnCzrG4X0VlYEad?=
 =?us-ascii?Q?Hc6PhtWt3L5mAINRnYEfjjMlQdxZMnq/9/bWyCHtkBx3te9ZJwgTVOiujZ27?=
 =?us-ascii?Q?HZVT9yMDIx9exVK+e78L/wiBnivlIz3ba39jnpqfi4olBkeoXndWcMmJQfDz?=
 =?us-ascii?Q?f6PAqROkbmGvmKO8l/Jf9rye1hF9KvU03n0c+j5KjGJqluZxtaaOFfNZL1Dk?=
 =?us-ascii?Q?noFo0KYWhHIMx7PBBHJBgT8TZXZW2l+NQgmOtUwhcxeClRoyG85Zd9co0lkq?=
 =?us-ascii?Q?co5wNCBW8Fn136aNEd2gSlJKY7WbUr6sTodNvODWW+erL+hm9l3LSg/gRfDn?=
 =?us-ascii?Q?tPbAdni85FHb+U3L29SlebXM/7k0eCo6WrnE9W51kRYmliRd79UwfO7KTWYw?=
 =?us-ascii?Q?QqFhWPeM4h81iP3E8NXhKsNGmODAO4jgHWfc2N2KeGinYmmQaTk20Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q6lldj1SGNv0YLO0tSgiT5u9IJo9SpSjWGAMQfheRggkvAOKbKPkZHKEvQKA?=
 =?us-ascii?Q?k7B0Enj8OfwKPj3azCKwsSiehgHw4f4ntMXy0waXPBFzp0HMaNDNZz13++pa?=
 =?us-ascii?Q?wHnpHuJBUvAsAlqR89B5rDV9AtELbyy74ZI2FFLgTf4tD0WzmJmf0cUFASAr?=
 =?us-ascii?Q?8GWfEdktTwUqgOFBeYJISa5pielpOZxPV46E+Wwyjq0wtFd/00+6NpE7Cnyg?=
 =?us-ascii?Q?omVYyWZF82W8oWlmL6OW7ZvldrOi2jeiCQdJzb65c+RTjPAc4MftPrM/5owa?=
 =?us-ascii?Q?Cmj0zpdvLFn4dxFyInsEeWVe/XWGk0FN4LvOLEX9ZED6FTf8JaDgOpIvcmHF?=
 =?us-ascii?Q?EOEw9z8Ejx5t/SXaULbEYb7AZNpX9pWzskSqDWYGAJJIIoqafUgXAGQLmRKF?=
 =?us-ascii?Q?wm/b1yYslV6+5t1tgNUYcyU+yE1E47zHtJ/7xNcKYoMbhlhvsDYuZK6UZg6V?=
 =?us-ascii?Q?RnCL197fop3pBe7eAZfqv5t8N0v+XmzWBGcNQdkpHkYgnEu4TWvKIw3FRH+E?=
 =?us-ascii?Q?cNXiS0Gt3mK3rMiXMwfrSq5ghS3K6yhKD5ZhnfSfbKcTc1w1G4KiL7wulawh?=
 =?us-ascii?Q?3u21kpZUsehByIKR8NvvYhtyzC30gCQ4BiwOiAu9dNqMrcR56jSUjKuhfg+d?=
 =?us-ascii?Q?GnEwaAAbgXys+amRYDB+85rtgogUH/JLf6+oAdGql7NY1/9E3SRjJs+qGGWj?=
 =?us-ascii?Q?BxFjQYFitXcA7Z4Msl4dS7ZijCrakJQY0RiSYLUmCGm/QJd9KI59KnHh/GPt?=
 =?us-ascii?Q?qwvA5E7GsPA/K4CepZslU19FkKWu0wMpeVMEw47EE/Zu4UA+8MMCgWEiKlQJ?=
 =?us-ascii?Q?co+eFEPv+jgBuK56E5bOwLAQtdMJ7WL49Bb0cvQ6FRkCkysLTSfpYJC2l12R?=
 =?us-ascii?Q?lTKIKvX+XApvEnqipP52IRCpq4q/VO5jeqMdcNi9UP/Tc77wbfMvAVZpPIoh?=
 =?us-ascii?Q?XvPtAtnltz9S1UeI/lzlEPchjbUnrQ8MW+5r8ph6w/B98LSc8le49ViWIBhw?=
 =?us-ascii?Q?msKI+w/9UULnQ5XAQX2pyiKkxlqnKz/SB0JewzgbfnZEOFhPKup1InoivzeB?=
 =?us-ascii?Q?yvPCFZvG8pUhMlEzvz8v8+hsWuPZxaIhYQDsX7pJ3rlokNJ7P86M9Xz30q5a?=
 =?us-ascii?Q?6BNXvSHbvAVmDotE13w5JdfJz5xT/zHpdGogEu1iayAYHV0V7xkmziCg1Eho?=
 =?us-ascii?Q?mhVhLLUt7MiGZY04h60LhvwcZdeU5lDKO1pXQpS+6z9L7+lyMQL4jLtT/0uX?=
 =?us-ascii?Q?sUgZ4OR0X+++/J8FSSbI0gOHq7tHBex7XOAw3lXQWkKuPumgD1XZVN4JbAA/?=
 =?us-ascii?Q?w/3aUwJHm4xIU4QqeIcCj32qA7hC7UBYWhoD80EZiqLjccicHIutrbKXtcYe?=
 =?us-ascii?Q?jbS0ASH17oo67Ys7yWpJd1Cqj1F6vqjyp0p3R3PBmPkVk/Z8GFMyK998Yo/A?=
 =?us-ascii?Q?P0UUtS3PYjw3CUGU0VsXxiUVXw4Fcx23d2xHMiUndUYARoyVXS2vrW/xVlVf?=
 =?us-ascii?Q?BtA5sx6zpD7MDN11LtH5Dw6eoLoMuN6oi5fCqNi5zlD0DFngwkIdRkuQS1nk?=
 =?us-ascii?Q?jLdrJoLshsdqZvw7Zv/S1jF/2gExdSvfS7nh+33f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649c0e03-b35b-4421-50df-08de04294c76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2025 16:07:35.5836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GmeidR9aG6G+1IPsWAk4yJQQwWCdisyHSrFWUKsrN4ZBRpfTT9ZCOjM0UVt38lXRLpSGBrIClkW9jtXr77w8mb+ij8BvU4Lni9lXWCDTRmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12618

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 05 October 2025 15:44
> Subject: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watch=
dog
>=20
> Renesas created different watchdog IPs but they are all handled in the sa=
me binding documentation. This
> leads to a lot of conditional handling which makes it unnecessarily hard =
to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Changes since v1:
> * moved 'clock-names' and 'power-domains' to top-level 'required:'
>   (Thanks, Prabhakar)
> * removed unneeded label from example (Thanks, Prabhakar)
> * added tags from Guenter and Prabhakar (Thanks!)
>=20
>  .../watchdog/renesas,r9a09g057-wdt.yaml       | 110 ++++++++++++++++++
>  .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
>  2 files changed, 115 insertions(+), 92 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057=
-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> new file mode 100644
> index 000000000000..1c1c464b95e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.y
> +++ aml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H

Looks there is duplication of entries for RZ/T2H?

Cheers,
Biju

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-wdt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          maxItems: 1
> +        reg:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    watchdog@11c00400 {
> +            compatible =3D "renesas,r9a09g057-wdt";
> +            reg =3D <0x11c00400 0x400>;
> +            clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> +            clock-names =3D "pclk", "oscclk";
> +            resets =3D <&cpg 0x75>;
> +            power-domains =3D <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 2a15c012fd67..08ba128bf442 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -51,38 +51,14 @@ properties:
>                - renesas,r8a779h0-wdt     # R-Car V4M
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
>=20
> -      - items:
> -          - enum:
> -              - renesas,r9a09g047-wdt # RZ/G3E
> -              - renesas,r9a09g056-wdt # RZ/V2N
> -          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> -
> -      - enum:
> -          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> -          - renesas,r9a09g077-wdt    # RZ/T2H
> -
> -      - items:
> -          - const: renesas,r9a09g087-wdt # RZ/N2H
> -          - const: renesas,r9a09g077-wdt # RZ/T2H
> -
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    maxItems: 1
>=20
>    interrupts:
>      maxItems: 1
>=20
>    clocks:
> -    minItems: 1
> -    items:
> -      - description: Register access clock
> -      - description: Main clock
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: pclk
> -      - const: oscclk
> +    maxItems: 1
>=20
>    power-domains:
>      maxItems: 1
> @@ -96,76 +72,13 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - interrupts
> +  - power-domains
> +  - resets
>=20
>  allOf:
>    - $ref: watchdog.yaml#
>=20
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - renesas,r9a09g077-wdt
> -    then:
> -      required:
> -        - power-domains
> -        - resets
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -    then:
> -      properties:
> -        clocks:
> -          minItems: 2
> -        clock-names:
> -          minItems: 2
> -      required:
> -        - clock-names
> -    else:
> -      properties:
> -        clocks:
> -          maxItems: 1
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -              - renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        interrupts: false
> -        interrupt-names: false
> -    else:
> -      required:
> -        - interrupts
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        resets: false
> -        clock-names:
> -          maxItems: 1
> -        reg:
> -          minItems: 2
> -      required:
> -        - clock-names
> -        - power-domains
> -    else:
> -      properties:
> -        reg:
> -          maxItems: 1
> -
>  additionalProperties: false
>=20
>  examples:
> --
> 2.47.2
>=20


