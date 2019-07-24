Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7472BE9
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 12:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbfGXKAf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 06:00:35 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:52721 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfGXKAf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 06:00:35 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id D0F783A33C; Wed, 24 Jul 2019 12:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563962426;
        bh=040iD/WEPjoR+xqUriZtf7Aqy1J8O1ws6aTLzLWedQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UgKerQ0535CEGGfTmdp1vPTlTD99QRo8KXEcxXdQ59ki3b26Qs8x/gv9bgWaALuuv
         V0kdl12WWp/StubErKDMR2P0Pf5PdET00cjhPbIoP9Tt3BwF39jkd2HUkAb9nW7CQP
         pN6dBcwjjrwb1DrFynSGE0gGpXUK6LKSlzDr+gvQwo9DQ2SzEkwho6XEnBHf6ipdqw
         wkj565pkt8F4a5BW//2+Co2WVG39grH8ufdm1CzfZntjAtmSbUWEif6NopnTBELykx
         VrL35vVpoNspOxNJb1thiMqYbmlI8SBjaPiBa0DbcM5Y7VLhda3jShfscLjOtfJoDy
         d84Bl18Acj+Uw==
Date:   Wed, 24 Jul 2019 12:00:26 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190724100026.yk2j36idwjcwvkuc@valentin-vidic.from.hr>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <2a14874f-1e28-6e42-ab87-b2c1e1ca5ac4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a14874f-1e28-6e42-ab87-b2c1e1ca5ac4@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 24, 2019 at 02:43:58AM -0700, Guenter Roeck wrote:
> Here is a possible explanation for your problem.
> 
> https://lore.kernel.org/patchwork/patch/770990/
> 
> It seems like the memory resource is indeed reserved by the intel_pmc_ipc
> driver.

Thanks, I will check if I have that one loaded. Here is the
discussion on linux-i2c, they say it might be a BIOS problem:

  https://www.spinics.net/lists/linux-i2c/msg41504.html

-- 
Valentin
