Return-Path: <linux-watchdog+bounces-3895-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4087B0E936
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jul 2025 05:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D354E5E1D
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jul 2025 03:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174872475C7;
	Wed, 23 Jul 2025 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmrJOsnv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D817BEBF;
	Wed, 23 Jul 2025 03:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242229; cv=none; b=k8ja3dQMTvEwpn9Nsxyz01T23nT+DF201Dd51RbhvtLMil99oybFV8Zlz0OlZCSGtO/XHTPq6j32UMs2exaGAAMIj8dHWAMaHGGVpOzVVgpGpOBIQMATT4Ki0XMRCSG6eEuT8d0mbTUiWuuWN6tt3T8wyt66FIxEvc8xiW2iN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242229; c=relaxed/simple;
	bh=c0ej2Kns9rl083bMiPIHU275OymET5kYSruEwdejPpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOtvbES7/nQ7QMDBYTzZgvd4q+n2zUhepIpy/VSLDU5JBrXHW3IXKF3S4L7flXlDFzSAiSKs8U5J3VEYBAEXbQH7yy5+NDtWXG2U5l70NO8dnc6jPNT9cfDSd7mzhkfmPA9VOHc+/Yf8LWLI5Hsky6yvyi9Fr7CvTBYIk5BOBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmrJOsnv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26966C4CEE7;
	Wed, 23 Jul 2025 03:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753242228;
	bh=c0ej2Kns9rl083bMiPIHU275OymET5kYSruEwdejPpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmrJOsnvor7OfN90OWaFh5OF/kmeJyVH6vNafHsAc7HENXRCNIMmwiAvGWyk2UaGT
	 Qu5OLnZaYrRTSwslDmaAf4F6UMhw2JHg4drmwiLLpQWNC1C22QcvWgKV5fB6VfhPVi
	 dFjN9u8qO3Cx40lBl6A9cCH12+Eh8rShmEbOE4eYEFUfHnqHVJwC1AYlzM6kqH9rYx
	 /XsouUAvOm5WQHgA0sFp1kQmGi0dRcnh/J/DTkhnQyygGKwO4Jbw9G+ngLNapiXb2S
	 pEemqPaplwcu+MCzOggL1pq7TS6m07b+uxUMg+QwfDYBenPxKkNmQtsO8vRF4z05/r
	 SExWMGZRiZwHA==
Date: Tue, 22 Jul 2025 22:43:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Message-ID: <20250723034347.GA1025052-robh@kernel.org>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>

On Wed, May 21, 2025 at 05:00:09PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
>  .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 52 insertions(+), 15 deletions(-)

There's no reason for this to wait on discussions on the driver, so I 
applied it.

Rob

