Return-Path: <linux-watchdog+bounces-4210-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFFB484EC
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 09:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B0B1B2053B
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 07:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C732E2DCB;
	Mon,  8 Sep 2025 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJevj1Va"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678113B2A4;
	Mon,  8 Sep 2025 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315910; cv=none; b=UPLu+K7wWObTvNomWW7I28AY8sF1yQdSx3UkNjtxRaJoEb1XrnlSNRJTzdrLbM6lcROZKeNe2rFGKrMzulHMV7vmd7PMOawcg9sQSsqN+l6bKXjT27Kf3SZV8+jWDNH6l97trBnpBgTkUsp7Iffs+xDFOl/Aif9rcq21RDjvYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315910; c=relaxed/simple;
	bh=hYOzoWKEBM/BtWQa0qqsbJN76jL06X8FvYZBp7aOrlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HdNl+Uo5vcvxkjKy4/lncf7gytJpwLy+pT8NW0rVCu+9CCseClVxhQHlpaeLR/wh0brwYlT4p45/pMr8iVf8DJPIyhu7GgCB+tSeqRuEnRtkAQwCY9a7n7PNXHwK+DdTm1pCw/62nYIwohsnNIuI9aQVjo65yD03/G+DmLzAiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJevj1Va; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9F2C4CEF1;
	Mon,  8 Sep 2025 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757315909;
	bh=hYOzoWKEBM/BtWQa0qqsbJN76jL06X8FvYZBp7aOrlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJevj1VaI+ui3XH0g2sVKi9fAWl4Z+T5RSOgs0UGBP63obJv+6rSGyYFFNQ4NwYRQ
	 FSuC1zx6Y4nYv8rxTTE6IWq9t7L7+8XX/OYyIqCLbpS9JMtZmYsj436dpRFf1TbCBo
	 OmZTvJpIcg6UxTTvSISX6lM5K/tSrD+SlZr7NaR+rJiPl1OLtuIpJ6nvYnDvbFvhI3
	 pl+OtcF7y1p5sVkBvwu9I6YDLKT8CHEc6pGau7RqwZqa09Q2hcUtI8ZUghkJQa+a8L
	 0HZQUwfwvZMVrxbjkcjEuGVHvFL0Y5IJbzxgecH/ar/ZBFUH6NRA6P5t7+oI2IMkNO
	 JbNLllH/+z/ZA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Message-Id: <175731590658.4102.1088493924360430422.b4-ty@kernel.org>
Date: Mon, 08 Sep 2025 08:18:26 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 22 Aug 2025 15:15:24 +0200, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> [...]

Applied, thanks!

[5/7] dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
      commit: 530c7063f753e18a8c4b793cc9e96e3b529dc81d

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


