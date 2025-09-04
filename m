Return-Path: <linux-watchdog+bounces-4167-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FDB42DEC
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 02:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9D53B528B
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 00:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EA0AD2C;
	Thu,  4 Sep 2025 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr8ooTkp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF39749C;
	Thu,  4 Sep 2025 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756944621; cv=none; b=jMjyGFww3nhMakrpMX/xB1w/KypTI0kWh8nHbWDcfCg+hs7JcGxkQ1IUMWmacvic3ULOdbTvwRoqJbXM9bZMk0M1yFe2jCB942fp5dXSk+cxuQf4zYXeTSSM/RjI9KZbw6telkB8s2opEAaj1h77PPe6CSerhdEFCbch5gLPDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756944621; c=relaxed/simple;
	bh=xLTUgYpzyJUGQC8iGmNCWf2tluEEgft6La/4Blouoww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO28/Ndp46KaCVHOy9HLJ+Tb11SXyUEo2mKqgphcZxW8Q9ZM6IM0zGXxw4CLOVPAS6I7vPcpJ5ylgFUq79P8Ct7Y/4o2lVKC3LYa5Q+Ogljgz4atkzbFqZmRD9R5Bqf088DD89lwDpgarleUEVBgQ4wHJ/NyhpH1RI+1HxJinpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr8ooTkp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD611C4CEE7;
	Thu,  4 Sep 2025 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756944620;
	bh=xLTUgYpzyJUGQC8iGmNCWf2tluEEgft6La/4Blouoww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pr8ooTkp5X63oq60GYII6ufmf73Tu/V4wMy5FfBKW3enutpe21ce9NSZ9r/9+BIa1
	 QNmdc8QYmWEvlYACtm5vQBlmmQa/7R7TuwUjoq1NqXNG/iDyQcBkrz+A6mCPhnA0Bm
	 KaUAXelCuIWHuT5Bunwq6+1t4VKF3tIvpYCEuQ3sK5juz62hYLTbdhL2rzY0MHQgIr
	 Qd43UvP6ORpkbhcWf8nycewvgqOH8U8EyQOrTQBlhBLdOGNdQugD2nN0foJJoQNM63
	 7JcIA7/yGfCiVe2BKoGCT1x/Mh36Cf4T2EXGhnNc7t0hJ7wH0D/yKI/HRSf27sUHhy
	 x32cVoiNHYA1A==
Date: Wed, 3 Sep 2025 19:10:14 -0500
From: Rob Herring <robh@kernel.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <20250904001014.GA3405605-robh@kernel.org>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>

On Wed, Sep 03, 2025 at 07:33:58PM +0000, Hrishabh Rajput wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.

EFI provides a standard watchdog interface. Why can't you use that?

> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.

Is a watchdog really a hypervisor service? Couldn't a non-virtualized 
OS want to call a watchdog (in secure mode) as well? But I don't know 
how the SMCCC call space is divided up...

> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor. The driver supports start/stop
> operations, timeout and pretimeout configuration, pretimeout interrupt
> handling and system restart via watchdog.

Shouldn't system restart be handled by PSCI?

Why can't you probe by trying to see if watchdog smc call succeeds to 
see if there is a watchdog? Then you don't need DT for it.
 
Rob

