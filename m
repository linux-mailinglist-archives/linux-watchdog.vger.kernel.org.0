Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0A6261573
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 18:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731943AbgIHQu1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 12:50:27 -0400
Received: from foss.arm.com ([217.140.110.172]:58182 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731998AbgIHQuH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 12:50:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64D1D106F;
        Tue,  8 Sep 2020 05:48:37 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E995F3F73C;
        Tue,  8 Sep 2020 05:48:34 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     devicetree@vger.kernel.org,
        Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ray Jui <rjui@broadcom.com>, Wei Xu <xuwei5@hisilicon.com>,
        Li Yang <leoyang.li@nxp.com>, linux-kernel@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Chanho Min <chanho.min@lge.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Liviu Dudau <liviu.dudau@arm.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix users)
Date:   Tue,  8 Sep 2020 13:48:33 +0100
Message-Id: <159956909739.1981.1445009961790432291.b4-ty@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 28 Aug 2020 14:05:52 +0100, Andre Przywara wrote:
> This is an attempt to convert the SP805 watchdog DT binding to yaml.
> This is done in the first patch, the remaining nine fix some DT users.
> 
> I couldn't test any of those DT files on actual machines, but tried
> to make the changes in a way that would be transparent to at least the
> Linux driver. The only other SP805 DT user I could find is U-Boot, which
> seems to only use a very minimal subset of the binding (just the first
> clock).
> I only tried to fix those DTs that were easily and reliably fixable.
> AFAICT, a missing primecell compatible string, for instance, would
> prevent the Linux driver from probing the device at all, so I didn't
> dare to touch those DTs at all. Missing clocks are equally fatal.
> 
> [...]

I have picked 2 patches for Arm Ltd boards/models.

Applied to sudeep.holla/linux (for-next/juno), thanks!

[1/2] (korg_sudeep/for-next/juno, for-next/juno) arm64: dts: arm: Fix SP805 clock-names
      https://git.kernel.org/sudeep.holla/c/b83ded8a31
[2/2] ARM: dts: arm: Fix SP805 clocks
      https://git.kernel.org/sudeep.holla/c/a894c6dd56

--

Regards,
Sudeep

