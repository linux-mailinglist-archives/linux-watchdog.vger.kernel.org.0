Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC105533A0
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 15:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350642AbiFUNeY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 09:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbiFUNbI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 09:31:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB64C1CB02
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 06:28:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 898F521B8B;
        Tue, 21 Jun 2022 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655818121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=c0jsH01SfEzILkpTUyW7Wnn5Y0ercoLAGhzu6n/8SFs=;
        b=iJR+MFDhayFeRbMLSHHrtPwDW9KtOdXQIRXiMeMxiV8/NRh0aY/n8YMzZIBUVoXCtbFFo4
        aDCjlgzho6JmKu5v8eLBvbgvXh7j3atoPFiZ8SxZ07uZYRjZEcjsKRziZmY+7wFWAjPUad
        KDLN1pzqb8LPdsO8O6tiOvwBAAOvnNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655818121;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=c0jsH01SfEzILkpTUyW7Wnn5Y0ercoLAGhzu6n/8SFs=;
        b=n3KfSpcO09d7BiNBiMn+lbtt1o0GwM8FJs0OQq9kiE8uqnzF3xWbqrzUp0VC0XKbs56nyj
        VMOr5C+lc/BG2dBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 511C313A88;
        Tue, 21 Jun 2022 13:28:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yjdEEonHsWJpLQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 21 Jun 2022 13:28:41 +0000
Date:   Tue, 21 Jun 2022 15:28:40 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-watchdog@vger.kernel.org
Cc:     Terry Bowman <terry.bowman@amd.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO
 resource
Message-ID: <20220621152840.420a0f4c@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Unlike release_mem_region(), a call to release_resource() does not
free the resource, so it has to be freed explicitly to avoid a memory
leak.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 0578fff4aae5 ("Watchdog: sp5100_tco: Add initialization using EFCH MMIO")
Cc: Terry Bowman <terry.bowman@amd.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/sp5100_tco.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-5.18.orig/drivers/watchdog/sp5100_tco.c	2022-05-22 21:52:31.000000000 +0200
+++ linux-5.18/drivers/watchdog/sp5100_tco.c	2022-06-21 15:07:31.868814828 +0200
@@ -402,6 +402,7 @@ static int sp5100_tco_setupdevice_mmio(s
 		iounmap(addr);
 
 	release_resource(res);
+	kfree(res);
 
 	return ret;
 }


-- 
Jean Delvare
SUSE L3 Support
