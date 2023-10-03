Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A117B6E76
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Oct 2023 18:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240418AbjJCQ2S (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Oct 2023 12:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240395AbjJCQ2R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Oct 2023 12:28:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D9AC;
        Tue,  3 Oct 2023 09:28:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B53DC433C8;
        Tue,  3 Oct 2023 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696350494;
        bh=WAZ4LsEiib0jmeMdIBwYZqKFRQwg3WKSntq22mIwUus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DRCGaDCHopxlLC1JTCJyhPt84Xyn0JhCYi+/kbNvgpjso41TrMmTcVtTa9U0qEJdQ
         qdnxIQJKwKC8m6aEVMaQhjWpucuIGl25dGCfmlq+0UbJpWdFhCu10ok6F0q2eTulQz
         2y+2liWpKu+VKHsEdeXz2cN+DCBnluCNn8B2prQO66a7ZwM97n5QGmsmy7+uO0/vh1
         baIbPDhD+VuOXkMAXcV5rL6ukHO4FJ7c7SBZQoSsbtmMoDCUP1iXhAvhrO4WcFt/xJ
         fVW94LsqzmBiGEXQPEB1U6cXCZ6wyA5PiZIOiHi4S0Tgdkw7KaVV/aw5xkT4AEW/Qs
         gRTfFg9PmeaFg==
Date:   Tue, 3 Oct 2023 12:28:12 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Subject: Re: [PATCH 0/2] [5.15, 5.10, 5,4] watchdog: iTCO: Backport of
 handle_boot_enabled=0 fix
Message-ID: <ZRxBHLeZLtMXpGqt@sashalap>
References: <cover.1696230335.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1696230335.git.jan.kiszka@siemens.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 02, 2023 at 09:05:33AM +0200, Jan Kiszka wrote:
>This suggests a commit (and a follow-up fix for it) from 5.16+ for stable
>because it fixes the usage of watchdog.handle_boot_enabled=0 for iTCO,
>closing a monitoring gap in OTA update scenarios.
>
>These patches are applicable to and have been tested with 5.15, 5.10 and
>5.4 stable heads.

Queued up this and the other series, thanks Jan!

-- 
Thanks,
Sasha
