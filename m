Return-Path: <linux-watchdog+bounces-2009-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119097E360
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 22:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DC81C20EB4
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58225811A;
	Sun, 22 Sep 2024 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC2juqDe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921EB1E885;
	Sun, 22 Sep 2024 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037946; cv=none; b=M21Ol6mSajsmJiyMDxQkpPhLsOHhPIDn38EVBI80cznnsRXAFdEplofb3Ge+6P2fF+dTNjL4ywbqWjEtI9DFEijt+w/wgvUj+q0FCR6YUob43uZQD2vkQ72KLXcVFd0JZoPbN8c4BiW+3PiEEF98mAsCAhz4QTxA37TG/pQ+qzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037946; c=relaxed/simple;
	bh=cmPR+gNKjLsFb7B9ImGULkBn9ouFZ3QVi1sSESGiiuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7XfDOqcpyyHh+cympahiHU0S1tX6rvsjJsldK0wBPXlDVGThp2GCG5iDpfd/gjxbd7xUCme551oIbKHbtr7ttWRKpKfb+EK7U9JzysWfwMlNDHMhDHhemUiKIWFfLlskkU8hrkBCpEl1Rai8w3zFJthxYQBpnckKBAU74t+P0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC2juqDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A534FC4CEC3;
	Sun, 22 Sep 2024 20:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037946;
	bh=cmPR+gNKjLsFb7B9ImGULkBn9ouFZ3QVi1sSESGiiuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC2juqDepts5bH9DXGWDyW72FpoIiDazetc7xZAANZLw4tLm/4HsDi8UMQwNzufiD
	 58t84XrWf+vT9+gMHtaHGspnrBjBbWH0jrrXqpgJ/QNsBLKHuocMiJFXtoGfd3CRtL
	 N8WMy8mBjrdXPz9I0jD0+jcXwZo0RYPVAppCtcSAtE6iz9pJBEEVPiHLRyoNBlLiq7
	 8flynTzPbWn+LYsNqMdmqbdvC/lJvlytvUDYDM4ef54CljuLI99rX86A3ZmQkr37+A
	 GxFrLbMdH3TVYcZMG50Hwh+UxPofT72KaR0fhM2MFvEckJThtZeMtFlvT5czPttX1o
	 WNFiOvFdAmV+w==
Date: Sun, 22 Sep 2024 22:45:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 10/20] dt-bindings: arm: apple: Add A10X devices
Message-ID: <ycjxihf2ogs5hg7odlp7t3of22dr2qmv7budy4gtu46woxf2j2@4jk3r5ibvoel>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-11-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-11-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:59AM +0800, Nick Chan wrote:
> Add the following apple,t8011 based platforms:
> 
> - Apple TV 4K
> - iPad Pro (2nd Generation) (10.5 Inch)
> - iPad Pro (2nd Generation) (12.9 Inch)
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


