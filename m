Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A30D4663C7
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Dec 2021 13:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347247AbhLBMlf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Dec 2021 07:41:35 -0500
Received: from marcansoft.com ([212.63.210.85]:46164 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347218AbhLBMld (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Dec 2021 07:41:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 2B195419B4;
        Thu,  2 Dec 2021 12:38:03 +0000 (UTC)
To:     Sven Peter <sven@svenpeter.dev>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>
References: <20211130161809.64591-1-sven@svenpeter.dev>
 <20211130161809.64591-2-sven@svenpeter.dev>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 2/2] watchdog: Add Apple SoC watchdog driver
Message-ID: <1361696f-4f13-391d-0874-8a4cf339c7f7@marcan.st>
Date:   Thu, 2 Dec 2021 21:38:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211130161809.64591-2-sven@svenpeter.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/12/2021 01.18, Sven Peter wrote:
> Add support for the watchdog timer found in Apple SoCs. This driver is
> also required to reboot these machines.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
<snip>

Tested on j274 and j314s. Feel free to add:

Tested-by: Hector Martin <marcan@marcan.st>

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
