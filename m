Return-Path: <linux-watchdog+bounces-4297-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC168BB25B7
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 04:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96FA3428071
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 02:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AD923313E;
	Thu,  2 Oct 2025 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAURK3Cc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B179723183F;
	Thu,  2 Oct 2025 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759371806; cv=none; b=MnKeeL8nJQVeioF+gXExeF3hFL4usEz2cVUd17kh3QSsyeZlweN5MafnTjzhCPAcmU2li1zK4zetI1cTP8nI5S+65GaR/2Gt6yILtaIngrEW7uTIT13H5nZAfLpHniIjSwLTp1i0olCjf6nNey2Z5yAf0qSt31DZuLp+7XE+znY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759371806; c=relaxed/simple;
	bh=f6F5T4ofgePSMrIpSfWncXtRToqaf4DbSE2Qg6TyA5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAHNq3JzOju70N4th2htBULdJyZiplwP0pt+zRfwNoFxnHx3RbKifHOK/+uuEUmks7ZdtxmkVS4jay4+HhVFBeD4xfRKAgZ0OmfVH8CozCbBN7wX9/0ZsR7hyHJZdxUq7mEXwPA0vn6MOR6ER3hkLiGw1lgThDvK3VGQJI8Yo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAURK3Cc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58B6C4CEF1;
	Thu,  2 Oct 2025 02:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759371806;
	bh=f6F5T4ofgePSMrIpSfWncXtRToqaf4DbSE2Qg6TyA5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAURK3CcRZhmrwjwDz34dnpgcoJ+w1CqErCqRKDnVgJG9BDwsC7L0FMLTPNPYBCSx
	 imEsrNxY4hBvM4c65SBjVHzk6CNLS2fDKBYn7NfvzTrTuQhrq7vpxx7sx6C71pcagB
	 4/8dIMSQH+KNh/477DRvFmuGacgyFMrF5PVqTGVJ8oksamUkGLf7dGOVD0K8VcGkOO
	 iJ4lJZKGyTgeT6u4FPthYWTvkR3nNvVLYMe4c1gaiu1FwHrKOKWE9HmOdcrdvbGfRv
	 nwQivyEMw778URMEgoEN2fCybIWvT+QlfZ9SR4h2ylDBpdqp+yQl0Sipelo3JoGu/f
	 5O5MZrA27mZxw==
Date: Wed, 1 Oct 2025 21:23:24 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 0/4] dt-bindings: watchdog: factor out RZ watchdogs
Message-ID: <20251002022324.GA2916027-robh@kernel.org>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>

On Fri, Sep 26, 2025 at 01:22:12PM +0200, Wolfram Sang wrote:
> renesas,wdt.yaml describes lots of different hardware blocks which
> results in complex if-structs. Factor out the different IP blocks into
> their own files. I took over maintainership of the files for RZ/A and
> RZ/N1 but if someone else wants them, very fine with me. RZ/G2L and
> RZ/V2H have the original driver contributors as maintainers (Hi Biju, Hi
> Prabhakar :)). If these need changes, please let me know, too.
> 
> Passes 'dt_binding_check' and 'dtbs_check' after each patch here.
> Looking forward to comments.
> 
> Happy hacking!
> 
> 
> Wolfram Sang (4):
>   dt-bindings: watchdog: factor out RZ/A watchdog
>   dt-bindings: watchdog: factor out RZ/N1 watchdog
>   dt-bindings: watchdog: factor out RZ/G2L watchdog
>   dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
> 
>  .../watchdog/renesas,r9a09g057-wdt.yaml       | 113 +++++++++++++
>  .../bindings/watchdog/renesas,rza-wdt.yaml    |  51 ++++++
>  .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 +++++++++++++
>  .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  49 ++++++
>  .../bindings/watchdog/renesas,wdt.yaml        | 155 +-----------------
>  5 files changed, 330 insertions(+), 149 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Let me know if watchdog maintainers fail to pick this up. Seems to be 
hit or miss for bindings...

