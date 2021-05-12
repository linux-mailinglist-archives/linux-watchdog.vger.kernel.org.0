Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F57F37D4DD
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 23:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243389AbhELSdw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 14:33:52 -0400
Received: from mleia.com ([178.79.152.223]:32924 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346519AbhELRNt (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 13:13:49 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 May 2021 13:13:48 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 1E5D31264;
        Wed, 12 May 2021 17:04:28 +0000 (UTC)
Subject: Re: [PATCH -next] watchdog: Fix possible use-after-free by calling
 del_timer_sync()
To:     Zou Wei <zou_wei@huawei.com>, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1620802676-19701-1-git-send-email-zou_wei@huawei.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <f5b8a4e5-069b-290d-b0d6-2ef89f7a0d4a@mleia.com>
Date:   Wed, 12 May 2021 20:04:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1620802676-19701-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210512_170428_148887_70604D62 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message. 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/21 9:57 AM, Zou Wei wrote:
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
