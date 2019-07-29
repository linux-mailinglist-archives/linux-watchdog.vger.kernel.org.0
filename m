Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E17A879CA8
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 01:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbfG2XRT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 19:17:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34616 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbfG2XRS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 19:17:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so28780635pfo.1;
        Mon, 29 Jul 2019 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=HkvpmCkG29rEHPrHCBOe6aKoWAycz1XEexqcjeDcdw0=;
        b=pjDbaGaEu6f6htLBarESNWV0XibD04cP4IdPhDf0Kd4YQEdCnZ6+8Ih4oP3jqc0WgY
         GFBzOrRNjW2kdCTSxzP/QxIfU0l0GECDQbNtlbHSa0J/V9bF+0vVpiKq76adecHvq8cT
         LKm+JKuBGFl6j2d6CR4mu4Dsp00tM0AIrr+TGMUwkUFUwVcy5WwWu10zXzZHL56wLvYp
         PtJtuOdhiGxjh1RSK/EIxRE8O7y59gRzHYpFHC5mr09fSjH1xfEtZ7g7kaERnecq7ThI
         3eqYZCggXWR+nJ73a8+bvS+iyRx4fosOuuYbydvbQnjIvf6isSHSNyPhyk97aFlKWNY9
         4w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=HkvpmCkG29rEHPrHCBOe6aKoWAycz1XEexqcjeDcdw0=;
        b=QcXGPw70Ivs3rP3mdp979WfmwNSOoK74EGMlOhrjYKzKgRYn3SEgYBTsOcfl6HcHLi
         NSo5bnnu9s30RXnZDSCLTPg1HT/JyGASJKgEHxXHH+bIlsdK8C0xYnVzxIjHc5D4Pu+d
         G4vQTgtDQp31MGNW9AWVFbZXhMOjzPKoPQDruHWQUXKj+/EbBE0j57pTwZjYaYxEU/Li
         tF+XQYKmFIBGJGjCPdVz1luXAhL76u2clLsbe8p7yMNtiCFNB87onZsNNkcW0lB7n82S
         7TKFL9YjrWfc0PezPAywTn32AnlkwsPfnmMF/SS5RlxQ8kLpcHNKfp9WV6ikKs8vofgF
         UomQ==
X-Gm-Message-State: APjAAAWRgsR+ekbyIiqIR6/DBvWHVMIdmXYgbcxm+YzFPywYg9zt4QDJ
        nMISG1WKPosdPl+CTb/UDbsXp3cHuGQ=
X-Google-Smtp-Source: APXvYqw6+yOtblHBgQxn3JfKFEtOKOBUJpPai1ssy1HkZSX62MVXQG8r3yc1RStOnI1hHSyUbDMEtg==
X-Received: by 2002:a17:90a:20c6:: with SMTP id f64mr115255942pjg.57.1564442238289;
        Mon, 29 Jul 2019 16:17:18 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id z4sm52280088pgp.80.2019.07.29.16.17.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 16:17:17 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 16:17:13 -0700 (PDT)
To:     linux@roeck-us.net
cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog device drivers:pc87413_wdt: Rewriting of
 pc87413_wdt driver to utilize common watchdog interface (fwd)
Message-ID: <alpine.DEB.2.21.1907291614270.2893@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1879500136-1564442237=:2893"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1879500136-1564442237=:2893
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



---------- Forwarded message ----------
Hi all, sorry for the duplicate message Guenter, wanted to be sure my
message is transferred:

Thank you for your reply, Guenter! Sorry there were issues applying the
patch, I used git format-patch to produce the patch and pasted the main
contents into a plaintext email client so I thought it would work..

May I please request clarification on which functions are no longer needed?

Sorry about forgetting about that last misc_deregister(). Will do more
tests, if that’s alright with you.

In effect, may it be best to start the watchdog from the “init” function?

Thank you,
Mark
--8323329-1879500136-1564442237=:2893--
