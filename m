Return-Path: <linux-watchdog+bounces-4160-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE373B41E45
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 14:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5751658C3
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 12:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAAA28466F;
	Wed,  3 Sep 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHVh9yb0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1511E3DF8;
	Wed,  3 Sep 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901130; cv=none; b=uNB3gX1eY1rpO8fG6maw7zerFcIp9FaJM+X5mSdJhGv5sI/AZQSdCzxXFwmm0rhYaoQ6oZhJO1VbvJpzszVJ/6cw83VGoOGT11d2w99GnHfndO2gCGqfUrcnBaEmWPgqpjO0Uo6GHKXjxzvmw+BNuumBTBDJXNUDNcmzg7Lj8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901130; c=relaxed/simple;
	bh=aup+gzf2Lt05rd/wprBWownLIjmePQnXrVLdJyR1OxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F7mzZ6vEqMt27icv94FJlhtqXmWOFwXO2KzUU/UJOynL+yIy2xnGu+ghMjiNWCwJcR7W77GehbtC/DdLspXEWBAPAOO2T1X9QXhxiYUvSx5rFdqlZJ9CHHh9bZHSdzOZ0yzzRFepNLlRVYkqwS0XCFa/Zxk3MUFEiD8ZUEMaBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHVh9yb0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC52C4CEF0;
	Wed,  3 Sep 2025 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756901130;
	bh=aup+gzf2Lt05rd/wprBWownLIjmePQnXrVLdJyR1OxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IHVh9yb0AfvXl/SwCobh1VAHuPyutDxdqtprzAov56xmZtLt302tDtayZwfPUdgVy
	 rdD4itmEnAK6XUIRXpVIAnFg9HjEsx2/auFJyfKo2EHW1whgodehUXfCNaUYTLIn6a
	 lN6F4VZIh4+tZbO3Y21ZR11Rx+seHwGoDtqj0wVU7Qisp74EglaynrrRL6IhzmRx6N
	 1/91piLGWMt/iaKuUZSvLxbKB8jkbk3+XB6f2GxZGOC9rw/V7n3zDbfKgcoTNhKsIb
	 hUQ6NhvEffsjWp5/nuupNPkzULDm7kv/L6RbsHvkAq2i3WYk0jpHnVMK186Jd/ME+a
	 mJnDJefOAKXOw==
From: Lee Jones <lee@kernel.org>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
In-Reply-To: <20250822131531.1366437-3-mwalle@kernel.org>
References: <20250822131531.1366437-3-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v1 2/7] dt-bindings: mfd: sl28cpld: add
 sa67mcu compatible
Message-Id: <175690112670.2648157.2091192161586730887.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 13:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 22 Aug 2025 15:15:26 +0200, Michael Walle wrote:
> The Kontron SMARC-sAM67 module features an on-board house keeping uC.
> It's designed to be compatible with the older on-board CPLD used on the
> SMARC-sAL28 board. To be prepared for any board specific quirks, add a
> specific compatible.
> 
> 

Applied, thanks!

[2/7] dt-bindings: mfd: sl28cpld: add sa67mcu compatible
      commit: c7e00e6b452a5b875f07e16a007a1e92e9f813c7

--
Lee Jones [李琼斯]


