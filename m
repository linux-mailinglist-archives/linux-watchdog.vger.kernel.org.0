Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C3834860D
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Mar 2021 01:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhCYAvE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Mar 2021 20:51:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:37632 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232538AbhCYAvD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Mar 2021 20:51:03 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lPEDB-0003K7-QY; Thu, 25 Mar 2021 01:50:57 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@roeck-us.net, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles to snps, dw-wdt.yaml
Date:   Thu, 25 Mar 2021 01:50:54 +0100
Message-Id: <161663335606.1190848.11875320014476153759.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 18 Dec 2020 13:05:27 +0100, Johan Jonker wrote:
> The watchdog compatible strings are suppose to be SoC orientated.
> In the more recently added Rockchip SoC dtsi files only
> the fallback string "snps,dw-wdt" is used, so add the following
> compatible strings:
> 
> "rockchip,px30-wdt", "snps,dw-wdt"
> "rockchip,rk3228-wdt", "snps,dw-wdt"
> "rockchip,rk3308-wdt", "snps,dw-wdt"
> "rockchip,rk3328-wdt", "snps,dw-wdt"
> "rockchip,rk3399-wdt", "snps,dw-wdt"
> "rockchip,rv1108-wdt", "snps,dw-wdt"
> 
> [...]

Applied, thanks!

[2/8] ARM: dts: rockchip: add new watchdog compatible to rv1108.dtsi
      commit: 610e4c7215ddfa5c1bb52764717674ea8adb64f9
[3/8] ARM: dts: rockchip: add new watchdog compatible to rk322x.dtsi
      commit: 9ceb98f1ed19bc68129aa0db9da5adb4a40c0f1c
[4/8] arm64: dts: rockchip: add new watchdog compatible to px30.dtsi
      commit: d16c7082cff5e198f2435f08e2254e40f3058c75
[5/8] arm64: dts: rockchip: add new watchdog compatible to rk3308.dtsi
      commit: 58ead0c605e8a5f4139ed4dfffcdddac72e2eb31
[6/8] arm64: dts: rockchip: add new watchdog compatible to rk3328.dtsi
      commit: 2499448c920fc9648350d4f21e1fbd00ccd108ee
[7/8] arm64: dts: rockchip: add new watchdog compatible to rk3399.dtsi
      commit: 6b5c50863b3e6837f856a137fe6880ed4662335b
[8/8] ARM: dts: rockchip: remove clock-names property from watchdog node in rv1108.dtsi
      commit: 398a4087872a44921d0ede2afef53a3c9f779ab6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
