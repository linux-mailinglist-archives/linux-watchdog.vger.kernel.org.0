Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEC51AE140
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Apr 2020 17:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgDQPf0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Apr 2020 11:35:26 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:44160 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgDQPf0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Apr 2020 11:35:26 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id D3DB2409C6; Fri, 17 Apr 2020 16:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D3DB2409C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1587134527;
        bh=TglIglymen+0l3jpMVfA4VvuZ/dNkRNnlrOrHUD5mdI=;
        h=Date:From:To:Cc:Subject:From;
        b=RPaeLYTEWiTVx4Ud2ip1H1y5W/g7nbruaBcjUU7xZRsLscEz3KE0OV0yrZ9ya55YY
         USTuZSCSYJ1Kin+ClV3Zc2XXY6D/PD4EYOlN/KnmDAne8cbaIcxo/Kfc7o7gijz1cU
         vKmyTNd5vW87DHqlJ6xLjdD5Qw0+TqGDH+XCj0mA=
Date:   Fri, 17 Apr 2020 16:42:07 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Walle <michael@walle.cc>
Subject: [GIT PULL REQUEST] watchdog - v5.7-rc2 Fixes
Message-ID: <20200417144207.GA29911@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.2 release cycle.

This series contains:
* sp805: fix restart handler

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 2d63908bdbfbce0d98195b22236ad5105dc6eba2:

  watchdog: Add K3 RTI watchdog support (2020-04-01 11:35:23 +0200)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.7-rc2

for you to fetch changes up to ea104a9e4d3e9ebc26fb78dac35585b142ee288b:

  watchdog: sp805: fix restart handler (2020-04-08 11:18:38 +0200)

----------------------------------------------------------------
linux-watchdog 5.7-rc2 tag

----------------------------------------------------------------
Michael Walle (1):
      watchdog: sp805: fix restart handler

 drivers/watchdog/sp805_wdt.c | 4 ++++
 1 file changed, 4 insertions(+)
----------------------------------------------------------------

Kind regards,
Wim.

