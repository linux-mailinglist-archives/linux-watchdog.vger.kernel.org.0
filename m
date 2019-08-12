Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F4E8A7FE
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHLUJU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44065 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfHLUJT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so50038306pgl.11;
        Mon, 12 Aug 2019 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yOH/l5VVvJ/APoIXtS0hIUc7Vo2Yr/xD5KyQELauzII=;
        b=XX0k60SJVYFMwhme2eoW7vD8EvkYFZZG+X9lU6zXyUtUZuG5mVHw1ivvPE5BrhiLQF
         zWbh1ttxqa9Szc9aDj7z5dya7qXDvUaeHogMA0399grseuPZw45d+BlWKPjJBkOG7LOE
         YJxOUTK7IsiYm46g8qzTENaQh9t+lNro36SOAEqZtRpptYhrd4FDnKywBNFIhyRRB2KC
         Q4SCwM7OFSAuIL71TeaNHi/ngP5Ek8gRZrGFk3SkivJKbxW46QjqbSJCQ1ElrJ2khXry
         R2dGod6iE40klxkd2o9jMVlUM08gGrstf/ygXY7iIe5E99G0iB3Lxf1AIjp0VwPef/kQ
         4/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yOH/l5VVvJ/APoIXtS0hIUc7Vo2Yr/xD5KyQELauzII=;
        b=HbxIy+lZIgVmn7RJcJKFuhKrCPMFA5AEleeN/gFbU66znLZV+JcS/zaRxi0hOAV+IE
         7pBaxKNz82duQgImRqj8a3Qk20HL5LlHxFxcDwIzY5Gj/A6+yKKf7dfMBT5JlQBgzr28
         7U1WjZcUZZIv3WnKQuHmm67h8lxIeKEaadlfNHil5VT9dNx8o8iuad5O7Z902SE4DnXE
         Z5rtCpKoAAcg8oQUh7ozVdpxZPlx4BZsY22V7WqESidGQ+Rpdnn3biHJgdWOc3UdBE76
         65jeJPaxdOFlbaD/kTSyaMIZYDcaWRqDh65I+CjCaW+Jr+EXeTnbYWTCdHdHJ+hSr3yr
         tmdg==
X-Gm-Message-State: APjAAAW920XoQhNuHzEyhoMXd664AA5uTPNdjXILBa19ZOWmrUP7NSHg
        VZjP2RBHXXYLleUk95uhdlq3oiN5
X-Google-Smtp-Source: APXvYqy+ttPNWHPaIQC74fCoo/FvLmQkdG4FrGYx7ZNwGDjSyLhE0tsTeIOksDbVJ69S4ood9SAF4Q==
X-Received: by 2002:a17:90a:bf92:: with SMTP id d18mr975798pjs.128.1565640558858;
        Mon, 12 Aug 2019 13:09:18 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:18 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/22] Ziirave_wdt driver fixes
Date:   Mon, 12 Aug 2019 13:08:44 -0700
Message-Id: <20190812200906.31344-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Everyone,

This series contains various fixes/improvements for ziirave_wdt
driver. Hopefully each commit is self-explanatory.

Feedback is welcome!

Thanks,
Andrey Smirnov

Changes since [v1]:

    - Collected Reviewied-by from Guenter

    - Added two more error messages to "watchdog: ziirave_wdt: Be more
      verbose during firmware update" (Guenter, I kept your
      Reviewied-by there since that change seemed trivial enough)

    - "watchdog: ziirave_wdt: Don't bail out on unexpected timeout
      value" changed to select a default timeout of 30 seconds if read
      out timeout value is out of valid range

    - Additional fixes I wrote while working with watchdog firmware
      added to the series


Andrey Smirnov (22):
  watchdog: ziirave_wdt: Add missing newline
  watchdog: ziirave_wdt: Be verbose about errors in probe()
  watchdog: ziirave_wdt: Be more verbose during firmware update
  watchdog: ziirave_wdt: Don't bail out on unexpected timeout value
  watchdog: ziirave_wdt: Log bootloader/firmware info during probe
  watchdog: ziirave_wdt: Simplify ziirave_firm_write_pkt()
  watchdog: ziirave_wdt: Check packet length only once
  watchdog: ziirave_wdt: Skip zeros when calculating checksum
  watchdog: ziirave_wdt: Fix incorrect use of ARRAY_SIZE
  watchdog: ziirave_wdt: Zero out only what's necessary
  watchdog: ziirave_wdt: Make use of put_unaligned_le16
  watchdog: ziirave_wdt: Don't check if ihex record length is zero
  watchdog: ziirave_wdt: Don't read out more than 'len' firmware bytes
  watchdog: ziirave_wdt: Don't try to program readonly flash
  watchdog: ziirave_wdt: Fix misleading error message
  watchdog: ziirave_wdt: Fix JUMP_TO_BOOTLOADER payload
  watchdog: ziirave_wdt: Fix DOWNLOAD_END payload
  watchdog: ziirave_wdt: Fix RESET_PROCESSOR payload
  watchdog: ziirave_wdt: Drop status polling code
  watchdog: ziirave_wdt: Fix DOWNLOAD_START payload
  watchdog: ziirave_wdt: Drop ziirave_firm_write_block_data()
  watchdog: ziirave_wdt: Update checked I2C functionality mask

 drivers/watchdog/ziirave_wdt.c | 351 ++++++++++++++++-----------------
 1 file changed, 173 insertions(+), 178 deletions(-)

-- 
2.21.0

