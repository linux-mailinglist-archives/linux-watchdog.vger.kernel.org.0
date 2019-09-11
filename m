Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5EFAF5BA
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2019 08:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfIKGZN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Sep 2019 02:25:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbfIKGZN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Sep 2019 02:25:13 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA90521A4C;
        Wed, 11 Sep 2019 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568183112;
        bh=hCbZS1o48KxJrpYExCJxiNPbnrNzs3OfxozWwvpDhuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIlFru8Ct1z4S2opSkZw5q19V0V4pMjDvw2WD5JoiOQbDqwv0cZ8SYdwx2Rsz/2gx
         iYQsEDXdb6c3J4FqhgIGnHx9YLyqOY/wASeNFtYgBkKBNq9vCQdKxc/UraiQZW0Aql
         1n29syKXzK52UpeWQxigocN35uOdKMeUC+AwjUJQ=
Date:   Wed, 11 Sep 2019 14:24:55 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk,
        otavio@ossystems.com.br, leonard.crestez@nxp.com,
        schnitzeltony@gmail.com, u.kleine-koenig@pengutronix.de,
        jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V4 3/4] ARM: imx_v6_v7_defconfig: Enable
 CONFIG_IMX7ULP_WDT by default
Message-ID: <20190911062454.GA17142@dragon>
References: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
 <1566441463-11911-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566441463-11911-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 10:37:42PM -0400, Anson Huang wrote:
> Select CONFIG_IMX7ULP_WDT by default to support i.MX7ULP watchdog.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch #4 and #5 look good to me, and I will pick them up once the first
3 get applied by Guenter.

Shawn
