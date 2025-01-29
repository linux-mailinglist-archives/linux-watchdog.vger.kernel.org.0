Return-Path: <linux-watchdog+bounces-2808-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E5A22704
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jan 2025 00:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F481631A2
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 23:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6231D79BE;
	Wed, 29 Jan 2025 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S71mp1bS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8871A2398;
	Wed, 29 Jan 2025 23:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738194674; cv=none; b=tzJzHUCKClTsJN5Pfx8icey8bzT1mtIixjU3JuSIlmWQtsSYJwvfxVfsrIU8bEuzMIV6Wtzz+D+BCFowP73tafAEOdOCCjBxsKxM3174P5hPaULlr8HHUh8X4lplkdcadIUuq07P49CmJn9AFSsytc3bPp5O7ibtX9NqP0FK+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738194674; c=relaxed/simple;
	bh=X1DWthkFK7bVjwOsyceu0okvIVLL7ToeBmOfeUVYWAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFJxjLg9mOOteDtGqZToOupGryVqUQ7kyz4YZBlBPPCNSKwonj9iagneC3xIrw8Dj0jtJTBPA62JyJghssw/8Q0gw5Hb7/xd9rafNZsK3pzVoWreyTlUUyI8FFGXsWIU06RPGR+NN9S1F8G7QWFS/rLtTb/Awib7QxXYfyX2mZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S71mp1bS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF02C4CED1;
	Wed, 29 Jan 2025 23:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738194673;
	bh=X1DWthkFK7bVjwOsyceu0okvIVLL7ToeBmOfeUVYWAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S71mp1bSXxMQHriXYPCJZud3d1pRDkVLAaB4OScGG2/RdoRGqDJnlUlZiwgfi5oWq
	 EpNzX5km+ql4N3vpCcK1rXGAU+3GjJzMwSI21ybZloHmuCV1cNch4xfTmRRHxh9DBi
	 mxCCSkdhO6lrC0JUrsljV6Lzjq4C5DfBl/1DwByQ+CzJdQNnfSlEkzSoGJMMdD3SQ2
	 kx4N4PgM5Lqis5HiGyAON/cvtig3Fh69K3esOs/fBolz3xZwe4fdsgX7KEjyO/yaxh
	 6nWltT4NBUkVrGWSvB7eSA6EDaqn5HL44cBe/FCKCKiyFp1l0Yhh0iSfDltQ3Zt7+2
	 Qy/wVYOATKWLg==
Date: Wed, 29 Jan 2025 17:51:12 -0600
From: Rob Herring <robh@kernel.org>
To: Harini T <harini.t@amd.com>
Cc: linux@roeck-us.net, michal.simek@amd.com, srinivas.neeli@amd.com,
	shubhrajyoti.datta@amd.com, srinivas.goud@amd.com,
	wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] dt-bindings: watchdog: Add optional power-domains
 property
Message-ID: <20250129235112.GA3169498-robh@kernel.org>
References: <20250129161014.3882952-1-harini.t@amd.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129161014.3882952-1-harini.t@amd.com>

On Wed, Jan 29, 2025 at 09:40:14PM +0530, Harini T wrote:
> AMD/Xilinx Versal Window Watchdog Timer has its own power domain, so add
> an optional property to describe it.

Please fix your subject to indicate this is for xlnx,versal-wwdt, not 
*every* watchdog.

> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>  .../devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
> index 14b069599740..fccfc785a077 100644
> --- a/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
> @@ -32,6 +32,9 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

