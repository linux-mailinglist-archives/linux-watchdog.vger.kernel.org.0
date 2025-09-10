Return-Path: <linux-watchdog+bounces-4215-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D8B5231F
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 22:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38AA57B68D1
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 20:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0091E2FB629;
	Wed, 10 Sep 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjQYb7Is"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95982F39A5;
	Wed, 10 Sep 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537719; cv=none; b=RLbomLs0FwdvrJu6tuXSTMpqHKNiHG07MtbGiTxPANH08ONUj0uS/0mvntLOFdyj3usOfCMcMop5dAaQhVGO0jQWKRCzbI4GWRMxIUDQ1Jaa3S8DwRbeLp1V2NmgTJfJPwcCssDOj9gbtu2xSQ28TTGbuyVGIyISdMUKPm9mbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537719; c=relaxed/simple;
	bh=gvT9FuWxfZPeqzMQVg7GrtSY0I8p+kp7K2Qrz5hOw1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8m5F6JuZzR7DmRhO0aYdEqniTjsduygGpZrNCAqiYBiyOGXV6+v+l1w4MLGqUmYguMdOtUhfWIGt9zlEmYRbS58soGlWarvk+Feh/SI0QSjaXuT+/912TM2FAIVvCU7Qff8zbKwo2NS51Erw4GpLQwxjP8SQB4+Kf6OgjLtOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjQYb7Is; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4BEC4CEF7;
	Wed, 10 Sep 2025 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757537719;
	bh=gvT9FuWxfZPeqzMQVg7GrtSY0I8p+kp7K2Qrz5hOw1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjQYb7IsfJnAIuyyBxN9tylvu4CPrjT2KQzODDUVZ/mB+RChZrFX4TXJcNajCA2cc
	 P0bU7zrxL5PsQm8t3jqzpBGFbhQ8obdRWTK8AlOBGgAUxGJumDEyRpujIvGxy7zWIi
	 zBbVYSOFcGWKFiqebAGtlGUYtTmUCiPwHCkxITKjkvniidTH0MIURbk+GYeCJoBbSV
	 8uPvhngmkiOQEnwzeUSY3sdKvz05h/BC+CA0cNnVKCcHtxsKCEBbt3RRfxEO95a43W
	 F2UIxVjpNV4YZ1xhqgMF1pkZBjjSbzF50qDsDY1fWDP1cu3kXGJLpm/inRtmD4BssX
	 RbDq5B36odSNg==
Date: Wed, 10 Sep 2025 15:55:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,armada-3700-wdt
 to DT schema
Message-ID: <175753771781.400321.13844352093310893008.robh@kernel.org>
References: <20250812203301.726374-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812203301.726374-1-robh@kernel.org>


On Tue, 12 Aug 2025 15:32:57 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 3700 watchdog binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/watchdog/armada-37xx-wdt.txt     | 23 -----------
>  .../watchdog/marvell,armada-3700-wdt.yaml     | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 42 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
> 

Applied, thanks!


