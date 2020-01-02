Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E01612E5E0
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2020 12:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgABL4h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jan 2020 06:56:37 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47391 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgABL4h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jan 2020 06:56:37 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1imz5Z-0002We-MF; Thu, 02 Jan 2020 12:56:29 +0100
Message-ID: <f3a5ccdc211b5d94b1901e72cfc2ef57d4107054.camel@pengutronix.de>
Subject: Re: [PATCH v7 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
        wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com
Cc:     yingjoe.chen@mediatek.com, sboyd@kernel.org
Date:   Thu, 02 Jan 2020 12:56:27 +0100
In-Reply-To: <1577437494-738-2-git-send-email-jiaxin.yu@mediatek.com>
References: <1577437494-738-1-git-send-email-jiaxin.yu@mediatek.com>
         <1577437494-738-2-git-send-email-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 2019-12-27 at 17:04 +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged together with patch 2.

regards
Philipp

