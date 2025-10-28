Return-Path: <linux-watchdog+bounces-4419-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA37C137E6
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 09:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 282CF1A625D7
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FBC2DCF74;
	Tue, 28 Oct 2025 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4r25Ajy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D82DCF50;
	Tue, 28 Oct 2025 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639443; cv=none; b=LdWkOD7ZH00gTI4kiAcUHH+iJMnSnaDlp4jFP5LinMAmH/y0AcaAguRpkl6EdHSbSaLM6Wcp2YAVhMIbrXlW+Rrj2uaNwrqgNUMD266hWi0LNYVwdO9q0Z8RFRJHeZ9FeaGLkCChdVkg6ZbBr1PnsPpa/1vx0aixRkR+/nw668Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639443; c=relaxed/simple;
	bh=qyT91W42PRR1k+MEQZv0hEXTAFbmtivniNwL/NC6hLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcaTV4CIt86qj75ROWolIxGyfIJp9dBCQY6hvpO78Kj1dsvRCRMWPQa1y0at0uSD/cnE8kStCXnwia2iqNUJeMnteLPzdoFW5CTFAXrsxanBWZl0qQpy6nXdz+sWk/bJrucYzhazoB60/eeUT51gLU+c9r+gyRtS0EqJtrd75L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4r25Ajy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B09C4CEFF;
	Tue, 28 Oct 2025 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761639443;
	bh=qyT91W42PRR1k+MEQZv0hEXTAFbmtivniNwL/NC6hLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4r25AjyOQUw9xJU5vPMMPqgp3oepywBN42/i4XeX7uXCxhSWZGYWZsglTKx+2WG8
	 x3y8u+JKEbhZq+j+zqUSed+j4YFgl/eepOz9e1BA+gZk7+WrXdNE/YAAPTZmUC3sxQ
	 LsX0fAct1KbOkSbhnw8Mu4hZR1JIJs8AUCGRoNWLGsIz7ttFsqe670dIGFlqLGdWbd
	 5wxfIIfzpsWoTx670lxx0Z3gur8EDX5Bi0vYfSaFVNeXiTN3zte2PDOMD/dPlzfeiR
	 yfoYmW9o/dKjQlSAvnCTt7nQtaQf+vVYgyeO+d6y61iuhOHvbT2eeWb0ZJ7CG1nkj7
	 NzuWC9BdX9YIA==
Date: Tue, 28 Oct 2025 09:17:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, hauke@hauke-m.de, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: lantiq,wdt: convert bindings
 to dtschema
Message-ID: <20251028-petite-demonic-spaniel-1cfed1@kuoka>
References: <20251027210959.58297-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027210959.58297-1-olek2@wp.pl>

On Mon, Oct 27, 2025 at 10:06:57PM +0100, Aleksander Jan Bajkowski wrote:
> Convert the Lantiq WDT Watchdog bindings to yaml format.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - removed xrx300 from strait binding conversion
> - moved falcon-wdt to previous enum
> - added ref to watchdog
> v2:
> - requirement of lantiq,rcu is now expressed as a schema
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


