Return-Path: <linux-watchdog+bounces-1314-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2C927B4A
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Jul 2024 18:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43B61F238CA
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Jul 2024 16:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A211B3721;
	Thu,  4 Jul 2024 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT1KJhzo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70561B29CA;
	Thu,  4 Jul 2024 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720111178; cv=none; b=iYgIvQPv2L+uDPKLu3xyg96pPQgJ35nAJJWYiJMBtFaZ6RJD2rV72Haw0U3GsLE5UxmO6drLZ/RqVwrbPaXIxgrhFHEm1unUfzgsDfxzYWQuXUurxYxYGNwu7AKnrVMe9zddzTU9G7l/wA4OPQkQOviIbbbZDOjoHplv53xSMc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720111178; c=relaxed/simple;
	bh=F5PUltn6ApzAxg/bkmpszqzCRC+BjMIEoLjRzNsshGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bBscvJw1K5XU6E6eKkSAULrDpyg2Ks9LwRA9V6L1aPI+zBlfO8/aS+Q8ihRAlR2ulfhlaFNEifZK6Wh3elX9wg6AkQFROeVTNDCbHVo7prh1noBeN4a1FOTz5Sc+i911D8nul8QvChntkC8SmKsHVX2oFqlRRDsyf0BcEJymzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OT1KJhzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D8EC3277B;
	Thu,  4 Jul 2024 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720111178;
	bh=F5PUltn6ApzAxg/bkmpszqzCRC+BjMIEoLjRzNsshGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OT1KJhzoBvCT1OYKZu/rk/giJMK9nsUWCW7PfNfTacGAoXTLftkwqp/Yn9gAwSEUL
	 0WA1q/19a002H9N7MalrAkr5kuXorV+2oFB417hMfjR+a/AhM/tZW5MArGscqsgLGD
	 JqkXBPQWgIjIzjfnFUUQRDcV/e0mHqL4AxJdOhGA3QuzillNxzmnUsvXSvCXMHFnAA
	 B9Q/rIRuAAqkjtqhTa0wmLDAA+QztaZNRIEwGLvuV+T3/mMynMgg990aI+vlS+U6nk
	 8aQiWNpJDNdmjAa9nCuAuvdfqxDTLaf7Pk8K9GM3zUzx3Fm9+TwOxhWsNY2KeaIaVB
	 uRwEe75D45Tbg==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <ZoJhQVF-U6sSJ_Sg@fedora>
References: <ZoJhQVF-U6sSJ_Sg@fedora>
Subject: Re: (subset) [PATCH] watchdog: Add missing include for FIELD_*()
Message-Id: <172011117629.538139.7683719128595286537.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 17:39:36 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 01 Jul 2024 10:56:49 +0300, Matti Vaittinen wrote:
> The FIELD_PREP() and FIELD_GET() macros are defined in the
> linux/bitfield.h. Include this header to avoid missing the macro
> definitions.
> 
> 

Applied, thanks!

[1/1] watchdog: Add missing include for FIELD_*()
      commit: e53cb372d75b5912fc72d9eebe8d37620fb58056

--
Lee Jones [李琼斯]


