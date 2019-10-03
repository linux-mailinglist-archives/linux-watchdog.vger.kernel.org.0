Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C155EC9A85
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Oct 2019 11:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbfJCJMj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Oct 2019 05:12:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728839AbfJCJMj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Oct 2019 05:12:39 -0400
Received: from X250 (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F016217D7;
        Thu,  3 Oct 2019 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570093958;
        bh=hC5RRC0CVdI9lSSoHciGX50R/JTCn6x4GLQJVZUPWw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TnJo2+0appSGZK4WOcQv7yGfWNzmU178Q94zKkpuaGpCJQJj5YwQfcuuhiLtGwY1l
         hUPjuURF33zxUkoE9s2anHyO5DmyE7UZm/knv4PrLGLPA4CndBoYNLd2Bs3PMdqwXa
         yOnxBixgpJYVknTrNzgrz+kXGTjUv1/l3eKrJIAU=
Date:   Thu, 3 Oct 2019 17:12:19 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk,
        otavio@ossystems.com.br, leonard.crestez@nxp.com,
        u.kleine-koenig@pengutronix.de, schnitzeltony@gmail.com,
        jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V5 3/4] ARM: imx_v6_v7_defconfig: Enable
 CONFIG_IMX7ULP_WDT by default
Message-ID: <20191003091217.GC22491@X250>
References: <1566999303-18795-1-git-send-email-Anson.Huang@nxp.com>
 <1566999303-18795-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566999303-18795-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 28, 2019 at 09:35:02AM -0400, Anson Huang wrote:
> Select CONFIG_IMX7ULP_WDT by default to support i.MX7ULP watchdog.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
