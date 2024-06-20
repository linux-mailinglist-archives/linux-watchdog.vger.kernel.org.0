Return-Path: <linux-watchdog+bounces-1175-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A74910079
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 11:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667D61F2195B
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 09:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309ED1A4F02;
	Thu, 20 Jun 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFVws6FY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EA19E836;
	Thu, 20 Jun 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876160; cv=none; b=ZyoUCMl8cYQtEsmVd2s0F+0VlFg50uHFb+tvbWZ0FVhWVDusx+q5F6xj7Y974D4ARu9h5G3wqZyFWv5oo99GVmxzQBaCmGHbGWwCYwlYQvvcjE3CnFGx0V3ayCJ4YPz1OhJhK1koXB+pV/EiIup71K+LzLDrZ0lk4/RB9WNol9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876160; c=relaxed/simple;
	bh=8we+OhQL+wj+5hQuaEZHowMrYqroa17RySsbu8nMXok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VNi41AwtdagV8Y+UHFaAQwEsMmNUFZ/4woChvLojsfS4WgHh+p+AX0bkWpPHCiWscsKGah1ZSH4D5mrFGdLKRqe9RqS1BzwbafURZhAlck2gh/nHk7nTO0OXWAjywL3rm+ecK3XOMDwFYjvca/tk+0EOPIy0Wk1hkXzhDwu+Jjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFVws6FY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA1EC2BD10;
	Thu, 20 Jun 2024 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718876159;
	bh=8we+OhQL+wj+5hQuaEZHowMrYqroa17RySsbu8nMXok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aFVws6FYFIAelZzuhoeUNzQ+Jpbg1+lvP4fiSYLEGVxfJsV4NhHdP0OqkaTOyAqHF
	 ADtkaVf2frCrdD44KJqzk5KLkh3KUEykrl9M+R/w5/Vy3HT2YAWMfwTWVflgW35YTb
	 UeDhtDOJHY/4HuaFk76JIIA18X+55j5guHAO7t9aKKfrPKCJaJemdH8UhXnH5tq8Zs
	 O1oF+w4gj8dmMIIz1YbHfqJwppkMbx4KxMiB+UjQILF/TjiGM15zTJ0q5J6XeWMcuR
	 hYDBUrSXRLSDwnbBATiilC4PdOrCSQ0jKESKe4m/Wl6cBN0zl+oFphtnKVI5yurq+e
	 XKlI2hBlWtM/g==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 0/6] Support ROHM BD96801 Scalable PMIC
Message-Id: <171887615676.1119049.7678370393770067068.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:35:56 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 14 Jun 2024 12:42:35 +0300, Matti Vaittinen wrote:
> Support ROHM BD96801 Scalable PMIC
> 
> The ROHM BD96801 is automotive grade PMIC, intended to be usable in
> multiple solutions. The BD96801 can be used as a stand-alone, or together
> with separate 'companion PMICs'. This modular approach aims to make this
> PMIC suitable for various use-cases.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: ROHM BD96801 PMIC regulators
      commit: 7edf20a5380779dd47e72b68e7cfa037dfd0807d
[2/6] dt-bindings: mfd: bd96801 PMIC core
      commit: ef0c63e3e22d4c9039831236e3b189caf538b4c0
[3/6] mfd: support ROHM BD96801 PMIC core
      commit: d701779ed5effdb55b8f08051ed1c5291fb9201c
[4/6] regulator: bd96801: ROHM BD96801 PMIC regulators
      commit: 79ab65717405d535b96a7bbf04eb8c71f9372985
[5/6] watchdog: ROHM BD96801 PMIC WDG driver
      commit: 10278981a2fb81fb07635b9649f6387f6a6a5abf
[6/6] MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
      commit: de9fa7d755fd0c5f90c5faa524db0cc13efd809e

--
Lee Jones [李琼斯]


