Return-Path: <linux-watchdog+bounces-1484-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D6950952
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 17:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5398B26169
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 15:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7AB1A072B;
	Tue, 13 Aug 2024 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5eU2x40"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563319EEB4;
	Tue, 13 Aug 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723563904; cv=none; b=EEVoijpDIIsYkwP7RCNVhS4T0mzFeqNyrGV3n9c3nyl5W1GRHJmfSkJWNsZhk1e9XxVZEWcY9xRB8082AfO2eyvhVR1hMTM7jjxP+r43SliRIyRKFcvDT0enu+1jzj3mSGEqAyyz1clDVWdJ67tzt132yBpm8gpRZmm1iYH8bno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723563904; c=relaxed/simple;
	bh=1ANdfs232+w5Vs3Yl9ejERbr5tB9TCOKpOWMEnEaUfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm8h6xkeQiHQgqxqu1FQjUplpuhlHubT85k/u74cSou4brgBw0Gd3wqgLgSx1eqJ8RDlEbNiM57gyU2NKxen9WBm1i+1t2lcD1TJO2JnBOVJvYCof1wFESQfeQYvx3FXDSwfPZgRjbhLJlrYUtNaq6ooySOBX/JtSJEZoBqZSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5eU2x40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67ED8C4AF0B;
	Tue, 13 Aug 2024 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723563903;
	bh=1ANdfs232+w5Vs3Yl9ejERbr5tB9TCOKpOWMEnEaUfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5eU2x40LoQ4mCVDbbCUyLlJF2YKy8+P9jtduKNDScobqxI0wIbjVGZqUS3LMzrmJ
	 6XsiqvPhs5cmphwrNfhrixRDIoHYxBjWolPrIA4Wf+cHeBFDqr3gFGKmp1hc8++Ej+
	 5RGJtHsDW3epLa4eRPRQa17L1m3GD1kVrtMhpOrYmx0PqsWexPeQSwjNrY01HC+UFB
	 VYTslhRRSiGjTrUdf5btlz5jNuV/xlWXmxkXvkMUfc4l3GPYtt94YWvu2CVIucPObs
	 cS4vc0k2sax0q9D4CFEUIC+GoP+cWirLgwnjuqlu/BjHeJRjN/OcveNLtkCSoRHwdO
	 YX9mQc5um5gdw==
Date: Tue, 13 Aug 2024 09:45:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kousik Sanagavarapu <five231003@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: ti,davinci-timer: convert to
 dtschema
Message-ID: <172356388765.1006105.18389526798273609029.robh@kernel.org>
References: <20240727050736.4756-1-five231003@gmail.com>
 <20240727050736.4756-2-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727050736.4756-2-five231003@gmail.com>


On Sat, 27 Jul 2024 10:34:43 +0530, Kousik Sanagavarapu wrote:
> Convert txt binding of TI's DaVinci timer to dtschema to allow for
> validation.
> 
> While at it, change the file name to match the compatible.
> 
> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/timer/ti,da830-timer.yaml        | 68 +++++++++++++++++++
>  .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
>  2 files changed, 68 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
> 

Applied, thanks!


